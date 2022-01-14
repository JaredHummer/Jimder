import { Component, OnInit } from '@angular/core';
import { Account } from '../models/Account';
import { Router } from '@angular/router';
import { AccountService } from '../services/account.service';

@Component({
  selector: 'app-matches',
  templateUrl: './matches.component.html',
  styleUrls: ['./matches.component.scss']
})
export class MatchesComponent implements OnInit {

  matches: Account[] = [];

  constructor(private router: Router, private accountService: AccountService) { }

  ngOnInit(): void {
  }

  ngAfterViewInit(): void {
    this.accountService.getMatches().subscribe((res: any) => {
      console.log(res);
      if (res.success) {
        const mtb = document.getElementById("match-table") as HTMLElement;
        for (const key in res.matches) {
          const match = res.matches[key];

          const row = document.createElement("tr");
          var td = document.createElement("td");
          td.innerText = match.username;
          row.appendChild(td);

          var td = document.createElement("td");
          td.innerText = match.contact_info;
          row.appendChild(td);

          var td = document.createElement("td");
          td.innerText = match.description;
          row.appendChild(td);
          
          mtb.appendChild(row);
          

          // mtb?.append("<tr><td>" + match.username + "</td><td>" + match.contact_info + "</td><td>" + match.description + "</td></tr>")
        }
      }
    });
  }

  

}
