import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Sample Application';
  isShown: boolean = false ; // hidden by default
  toggleShow() {
  this.isShown = ! this.isShown;
  }

}
