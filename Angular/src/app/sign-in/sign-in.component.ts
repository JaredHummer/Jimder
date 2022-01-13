import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AccountService } from '../services/account.service';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.scss']
})
export class SignInComponent implements OnInit {

  username: string = "gregelous0";
  password: string = "aA0";

  constructor(private router: Router, private accountService: AccountService) { }

  ngOnInit(): void {
  }

  async login() {
    let res = this.accountService.login(this.username, this.password);

    res.subscribe((data: any) => {
      console.log(data);
      if (data.success) {
        this.router.navigateByUrl("/swiping");
        localStorage.setItem("token", data.token);
      }
      else {
        alert("Invalid Username or Password");
      }
    })


  }

}
