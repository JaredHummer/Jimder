import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SignUpComponent } from './sign-up/sign-up.component';
import { ProfileComponent } from './profile/profile.component';
import { SignInComponent } from './sign-in/sign-in.component';
import { SwipingComponent } from './swiping/swiping.component';
import { ProfileEditorComponent } from './profile-editor/profile-editor.component';
import { LandingComponent } from './landing/landing.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { HttpClientModule } from '@angular/common/http';
import { HAMMER_GESTURE_CONFIG } from '@angular/platform-browser';
import { MyHammerConfig } from './my-hammer.config';
import { StoreModule } from "@ngrx/store";
import { MatchesComponent } from './matches/matches.component';
import { FormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    AppComponent,
    SignUpComponent,
    ProfileComponent,
    SignInComponent,
    SwipingComponent,
    ProfileEditorComponent,
    LandingComponent,
    MatchesComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    HttpClientModule,
    StoreModule,
    FormsModule
  ],
  providers: [
    {
      provide: HAMMER_GESTURE_CONFIG,
      useClass: MyHammerConfig,
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
