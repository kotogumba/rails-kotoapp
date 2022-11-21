import { Controller } from "@hotwired/stimulus"


const url='https://api.privatbank.ua/p24api/pubinfo?exchange&coursid=5'

export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!", this.element)
  }


}
