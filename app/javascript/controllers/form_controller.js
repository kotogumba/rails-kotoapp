import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["zone", "medicine" ]

  connect() {
    console.log("Hello, Stimulus!", this.element)
    console.log(this.formTotalTarget)
    console.log(this.zoneTarget.value)
  }

  input(event) {
    console.log(event.target.value)

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
        console.log(data)
        // get zone_id from the data
        const zoneId = data.id
        // fetch the medicines for that zone
        fetch(`/zones/${zoneId}/medicines`, {
          method: "GET",
          headers: {
            // accept the JSON response
            "Accept": "application/json",
          },
        })
          .then(response => response.json())
          .then((data) => {
            console.log(data)
            // get id and title from the data
            const medicines = data.map((medicine) => {
              return { id: medicine.id, title: medicine.title }
            }
            )
            console.log(medicines)
            // clear the select
            this.medicineTarget.innerHTML = ""
            // add the medicines to the select
            medicines.forEach((medicine) => {
              const option = document.createElement("option")
              option.value = medicine.id
              option.innerHTML = medicine.title
              console.log(option)
              this.medicineTarget.appendChild(option)
            }
            )
          })
      }
    )
  }
}
