import { Component, OnInit } from '@angular/core';
import { AccountService } from '../services/account.service';

@Component({
  selector: 'app-impression-info',
  templateUrl: './impression-info.component.html',
  styleUrls: ['./impression-info.component.scss']
})
export class ImpressionInfoComponent implements OnInit {

  currentImpression: any;

  constructor(private accountService: AccountService) { }

  ngOnInit(): void {
    this.currentImpression = this.accountService.currentImpression;
  }

}
