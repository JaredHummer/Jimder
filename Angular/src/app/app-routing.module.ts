import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ImpressionInfoComponent } from './impression-info/impression-info.component';
import { LandingComponent } from './landing/landing.component';
import { MatchesComponent } from './matches/matches.component';
import { ProfileEditorComponent } from './profile-editor/profile-editor.component';
import { ProfileComponent } from './profile/profile.component';
import { SignInComponent } from './sign-in/sign-in.component';
import { SignUpComponent } from './sign-up/sign-up.component';
import { SwipingComponent } from './swiping/swiping.component';

const routes: Routes = [
  { path: '', component: LandingComponent },
  { path: 'sign-up', component: SignUpComponent },
  { path: 'sign-in', component: SignInComponent },
  { path: 'swiping', component: SwipingComponent },
  { path: 'profile', component: ProfileComponent },
  { path: 'profile-editor', component: ProfileEditorComponent },
  { path: 'matches', component: MatchesComponent },
  { path: "info", component: ImpressionInfoComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
