import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AccountService } from '../services/account.service';

@Component({
  selector: 'app-swiping',
  templateUrl: './swiping.component.html',
  styleUrls: ['./swiping.component.scss']
})
export class SwipingComponent implements OnInit {

  currentImpression: any;

  constructor(private router: Router, private accountService: AccountService) { }

  ngOnInit(): void {
    this.next();
  }

  swipeLeft() {
    console.log("swiped left");
  }

  dont() {
    console.log("dont");
    this.next();
  }

  next() {
    this.accountService.nextPerson().subscribe((res: any) => {
      console.log(res);
      if (res.success) {
        this.currentImpression = res;
        this.accountService.currentImpression = res;
      }
    });
  }

  match() {
    console.log("match");
    this.next();
  }

  showMatches() {
    this.router.navigateByUrl("/matches");
  }

  moveProfile() {
    this.router.navigateByUrl("/profile-editor");
  }

  logout() {
    localStorage.clear();
    this.router.navigateByUrl("/");
  }

  showInfo() {
    this.router.navigateByUrl("/info");
  }

}
