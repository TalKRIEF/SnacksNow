import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-booking"
export default class extends Controller {
  connect() {
    console.log("Toggle-booking")
  }
}
