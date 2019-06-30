import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { MatButtonModule } from '@angular/material';

import { AppComponent } from './app.component';
import { HeaderComponent } from './header/header.component';
import { BoxComponent } from './box/box.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    BoxComponent
  ],
  imports: [
    BrowserModule,
    MatButtonModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
