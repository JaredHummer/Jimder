import { Component, OnInit } from '@angular/core';
import { Category } from '../models/Category';
import { AccountService } from '../services/account.service';

@Component({
  selector: 'app-profile-editor',
  templateUrl: './profile-editor.component.html',
  styleUrls: ['./profile-editor.component.scss']
})
export class ProfileEditorComponent implements OnInit {

  categories: Category[] = [];
  originalCopy: Category[] = [];

  constructor(private accountService: AccountService) { }

  ngOnInit(): void {

    this.accountService.getCategories().subscribe((res: any) => {
      if (res.success) {
        this.categories = res.categories;
        this.originalCopy = JSON.parse(JSON.stringify(this.categories));
      }
    })
  }

  toggleCategory(category: Category) {
    category.enabled = !category.enabled;
    console.log(category);
  }

  save()
  {
    for (let [index, category] of this.categories.entries()) {
      if (JSON.stringify(category) != JSON.stringify(this.originalCopy[index])) {

        this.accountService.updateCategory(category).subscribe((res: any) => {
          console.log(res);
        })
      }

    }
  }
}
