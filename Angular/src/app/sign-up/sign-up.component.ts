import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { token } from 'morgan';
import { AccountService } from '../services/account.service';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.scss']
})
export class SignUpComponent implements OnInit {

  username: string = "";
  password: string = "";
  confirm: string = "";

  constructor(private router: Router, private accountService: AccountService) { }

  ngOnInit(): void {
  }

  signUp() {
    if (this.password != this.confirm) {
      alert("password doesn't match");
      return;
    }

    let res = this.accountService.signUp(this.username, this.password);

    res.subscribe((response: any) => {
      console.log(response);
      if (response.success) {
        this.router.navigateByUrl("/profile-editor");
        localStorage.setItem('token', response.token);
      } else {
        alert(response.error);
      }
    })

    console.log(res);

  }

}
