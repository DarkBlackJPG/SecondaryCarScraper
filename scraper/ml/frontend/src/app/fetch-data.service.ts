import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http'
@Injectable({
  providedIn: 'root'
})
export class FetchDataService {
  uri = 'http://localhost:5000'
  constructor(private httpClient: HttpClient) { }

  fetch_all_models(): any {
    return this.httpClient.get(`${this.uri}/fetch_all_models`);
  }

  fetch_all_manufacturers(): any {
    return this.httpClient.get(`${this.uri}/fetch_all_manufacturers`);
  }



  execute_query(model: any, marka: any, kilometraza: any, godiste: any, kubikaza: any, konjskih_snaga: any): any {
    
    const data = {
      'model': model,
      'marka': marka,
      'kilometraza': kilometraza,
      'godiste': godiste,
      'kubikaza': kubikaza,
      'konjskih_snaga': konjskih_snaga
    }

    return this.httpClient.post(`${this.uri}/execute_query`, data);

  }

}
