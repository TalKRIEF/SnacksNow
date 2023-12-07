import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-booking"
export default class extends Controller {

  static targets = ["togglableElement"]

  connect() {
  }

  fire(event) {
    event.preventDefault();
    this.togglableElementTarget.classList.toggle("d-none");
  }
}
