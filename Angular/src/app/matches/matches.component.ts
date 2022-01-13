import { Component, OnInit } from '@angular/core';
import { Account } from '../models/Account';

@Component({
  selector: 'app-matches',
  templateUrl: './matches.component.html',
  styleUrls: ['./matches.component.scss']
})
export class MatchesComponent implements OnInit {

  matches: Account[] = [{id: 1, categories: [], password: "1", picture_url: "...", username: "sam"}, {id: 1, categories: [], password: "1", picture_url: "...", username: "jared"}, {id: 1, categories: [], password: "1", picture_url: "...", username: "bob"}];

  constructor() { }

  ngOnInit(): void {
  }

}
