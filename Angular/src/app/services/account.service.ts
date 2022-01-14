import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Category } from '../models/Category';
import { EndPoints } from '../models/endPoints';

@Injectable({
  providedIn: 'root'
})
export class AccountService {

  currentImpression: any;

  constructor(private http: HttpClient) { }

  login(username: string, password: string) {
    let headers = new HttpHeaders().set("Accept", "*/*").set("Content-Type", "application/json")

    console.log("attempting to login", username, password);
    return this.http.post(environment.apiUrl + EndPoints.Login, JSON.stringify({username: username, password: password}), {headers})
      .pipe(catchError(this.errorhandler))
  }

  signUp(username: string, password: string) {
    let headers = new HttpHeaders().set("Accept", "*/*").set("Content-Type", "application/json")

    console.log("attempting to signup", username, password);
    return this.http.post(environment.apiUrl + EndPoints.Create, JSON.stringify({username: username, password: password}), {headers})
      .pipe(catchError(this.errorhandler))
  }

  swipePerson(person_id: number, direction: boolean) {
    let headers = new HttpHeaders().set("Accept", "*/*").set("Authorization", localStorage.getItem("token") || "").set("Content-Type", "application/json");

    return this.http.post(environment.apiUrl + EndPoints.swipe, JSON.stringify({other_id: person_id, swipe: direction}), {headers})
      .pipe(catchError(this.errorhandler))
  }

  nextPerson() {
    let headers = new HttpHeaders().set("Accept", "*/*").set("Authorization", localStorage.getItem("token") || "");

    return this.http.post(environment.apiUrl + EndPoints.nextPerson, {}, {headers})
      .pipe(catchError(this.errorhandler))
  }

  updateCategory(category: Category) {
    let headers = new HttpHeaders().set("Accept", "*/*").set("Authorization", localStorage.getItem("token") || "").set("Content-Type", "application/json");

    return this.http.post(environment.apiUrl + EndPoints.category, JSON.stringify({categoryId : category.id, enabled: category.enabled, description: category.description}), {headers})
      .pipe(catchError(this.errorhandler))
  }

  getCategories() {
    let headers = new HttpHeaders().set("Accept", "*/*").set("Authorization", localStorage.getItem("token") || "");

    return this.http.get(environment.apiUrl + EndPoints.allCategories, {headers})
  }

  getCategory(categoryId: number) {
    let headers = new HttpHeaders().set("Accept", "*/*").set("Authorization", localStorage.getItem("token") || "");
    let queryParam = new HttpParams().set("categoryId", categoryId);

    return new Promise<any> ((resolve: any, rej: any) => {
      this.http.get(environment.apiUrl + EndPoints.category, {headers: headers, params: queryParam}).subscribe((res: any) => {
        resolve(res);
      })
    })
  }

  getMatches() {
    let headers = new HttpHeaders().set("Accept", "*/*").set("Authorization", localStorage.getItem("token") || "");

    return this.http.get(environment.apiUrl + EndPoints.goodImpression, {headers})
  }

  errorhandler(error: any) {
    console.error(error);
    if (error.error.error)
      alert(error.error.error);
    return [];
  }
}
