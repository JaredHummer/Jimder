import { Component, OnInit } from '@angular/core';
import { Category } from '../models/Category';

@Component({
  selector: 'app-profile-editor',
  templateUrl: './profile-editor.component.html',
  styleUrls: ['./profile-editor.component.scss']
})
export class ProfileEditorComponent implements OnInit {

  categories: Category[] = [{description: "Fitness", icon_url: "test", id: 0, name: "Fitness", enabled: false}, {description: "Reading", icon_url: "test", id: 0, name: "Reading", enabled: false}, {description: "Video Games", icon_url: "test", id: 0, name: "Video Games", enabled: false}];

  constructor() { }

  ngOnInit(): void {
  }

  toggleCategory(category: Category) {
    category.enabled = !category.enabled;
    console.log(category);
  }


}
