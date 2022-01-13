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

    this.accountService.nextPerson().subscribe((res: any) => {
      console.log(res);
      if (res.success) {
        this.currentImpression = res;
      }
    });
  }

  swipeLeft() {
    console.log("swiped left");
  }

  dont() {
    console.log("dont");
  }

  match() {
    console.log("match");
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

}
