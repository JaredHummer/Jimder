import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-landing',
  templateUrl: './landing.component.html',
  styleUrls: ['./landing.component.scss']
})
export class LandingComponent implements OnInit {

  constructor(private router: Router) { }

  ngOnInit(): void {
    if (localStorage.getItem("token")) {
      this.router.navigateByUrl("/swiping")
    }
  }

  signUp() {
    this.router.navigateByUrl("/sign-up");
  }

  login() {
    this.router.navigateByUrl("/sign-in");
  }

}
