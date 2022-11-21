import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus NAVBAR!")
    const url = "https://api.privatbank.ua/p24api/pubinfo?exchange&json&coursid=11"
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        console.log(data)
  })
  }
}
