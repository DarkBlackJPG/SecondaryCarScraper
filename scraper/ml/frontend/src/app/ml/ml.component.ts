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

  result:string = '';

  model:any = null;
  marka:any = null;
  model_encoded:any = null;
  marka_encoded:any = null;

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
              'encoded': resp[attribute][0],
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
            'encoded': resp[attribute][0],
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

  set_manu(id: any, encoded: any) {
    this.disable_model = false
    this.marka = id
    this.marka_encoded = encoded
    this.filter_models()
  }
  set_model(id: any, encoded: any) {
    this.model = id
    this.model_encoded = encoded
  }
  search() {

    if (this.model_encoded == null
    || this.marka_encoded == null
    || this.kilometraza == null
    || this.godiste == null
    || this.kubikaza == null
    || this.konjskih_snaga == null) {
      alert('Sva polja su obavezna')
      return
    }

    const formatter = new Intl.NumberFormat('en-US', {
      minimumFractionDigits: 2,
      maximumFractionDigits: 2,
    });
    this.fetchService.execute_query(this.model_encoded, this.marka_encoded, this.kilometraza, this.godiste, this.kubikaza, this.konjskih_snaga).subscribe((res: any) => {
      console.log(res);
      this.result =  formatter.format(res.result) + '€'
    })
  }
}
