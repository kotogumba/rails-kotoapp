import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["form-total", "zone", "medicine"]

  connect() {
    
  }

  input(event) {
    // GET to the server
    fetch(`/zones/${this.zoneTarget.value}`, {
      method: "GET",
      headers: {
        // accept the JSON response
        "Accept": "application/json",
      },
    })
      .then(response => response.json())
      .then((data) => {
        // get zone_id from the data
        const zoneId = data.id
        // fetch the medicines for that zone
        fetch(`/zones/${zoneId}/medicines`, {
          method: "GET",
          headers: {
            // accept the JSON response
            "Accept": "application/json",
          },})
          .then(response => response.json())
          .then((data) => {
            // get id and title from the data
            const medicines = data.map((medicine) => {
              return { id: medicine.id, title: medicine.title }
            })
            // clear the select
            this.medicineTarget.innerHTML = ""
            // add the medicines to the select
            medicines.forEach((medicine) => {
              const option = document.createElement("option")
              option.value = medicine.id
              option.innerHTML = medicine.title
              this.medicineTarget.appendChild(option)
            })
          }
          )
      })
  }
}
