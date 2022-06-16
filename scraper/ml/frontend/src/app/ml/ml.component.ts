import { Component, OnInit } from '@angular/core';
import { FetchDataService } from '../fetch-data.service';

@Component({
  selector: 'app-ml',
  templateUrl: './ml.component.html',
  styleUrls: ['./ml.component.css']
})
export class MlComponent implements OnInit {

  constructor(private fetchService: FetchDataService) {
  
   }

  all_models: any = [];
  all_manus: any = [];

  filtered_models: any = [];

  result = 0;

  model:any = null;
  marka:any = null;
  kilometraza = null;
  godiste = null;
  kubikaza = null;
  konjskih_snaga = null;
  disable_model: boolean = true

  ngOnInit(): void {
    this.fetchService.fetch_all_models().subscribe((resp: any) => {
        for (let attribute in resp) {                    
          this.all_models.push(
            {
              'id': attribute,
              'name': resp[attribute][1],
              'manu': resp[attribute][2]
            }
          )
        }

        this.filtered_models = this.all_models
        
    })

    this.fetchService.fetch_all_manufacturers().subscribe((resp: any) => {
      for (let attribute in resp) {               
             
        this.all_manus.push(
          {
            'id': attribute,
            'name': resp[attribute][1]
          }
        )
      }
    })
    
  }

  filter_models() {
    
    
    this.filtered_models = this.all_models.filter( (e: any) => {
      return e['manu'] == this.all_manus.find((ee : any) => {
        return ee['id'] == "" + this.marka
      })['name']
    })
  }

  set_manu(id: any) {
    this.disable_model = false
    this.marka = id
    this.filter_models()
  }
  set_model(id: any) {
    this.model = id
  }
  search() {
    this.result = this.fetchService.execute_query(this.model, this.marka, this.kilometraza, this.godiste, this.kubikaza, this.konjskih_snaga).subscribe((res: any) => {

    })
  }
}
