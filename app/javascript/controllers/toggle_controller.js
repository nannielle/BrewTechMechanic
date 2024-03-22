import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["form"]
  connect() {
    console.log("Hello from toggle_controller.js")
  }
  change() {
    this.formTarget.classList.toggle("d-none")
  }
}
