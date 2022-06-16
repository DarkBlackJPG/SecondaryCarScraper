import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MlComponent } from './ml/ml.component';

const routes: Routes = [
  {
    path: '',
    component: MlComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
