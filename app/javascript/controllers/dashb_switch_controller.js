import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashb-switch"
export default class extends Controller {

  static targets = ["acceptedBookings", "pendingBookings"]
  connect() {
    console.log("Hello from dashb_switch!");
  }
  fire(){
    this.acceptedBookingsTarget.classList.toggle("d-none");
    this.pendingBookingsTarget.classList.toggle("d-none");
  }
}
