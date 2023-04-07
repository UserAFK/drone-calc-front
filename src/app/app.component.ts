import { Component } from '@angular/core';
import { ApiService } from './services/api.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  public products: any[] | undefined;

  constructor(private apiService: ApiService) {
    this.apiService.getProducts().subscribe((products: any[]) => {
      this.products = products;
    });
  }
}
