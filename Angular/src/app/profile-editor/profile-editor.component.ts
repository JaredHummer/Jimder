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

    this.setCategories();
  }

  async setCategories() {
    this.accountService.getCategories().subscribe(async (res: any) => {
      if (res.success) {
        for (let [index, category] of res.categories.entries()) {
          this.categories[index] = {} as Category;
          this.categories[index].name = category.name;
          this.categories[index].id = category.id;
          this.categories[index].icon_url = category.icon_url;

          let temp = await this.accountService.getCategory(category.id);

          let htmlCat = document.getElementById(category.id) as HTMLInputElement;
          htmlCat.checked = temp.enabled;

          this.categories[index].description = temp.description;
          this.categories[index].enabled = temp.enabled;
        }
        console.log(this.categories, res);
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
