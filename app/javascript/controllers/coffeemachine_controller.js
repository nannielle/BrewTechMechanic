import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="coffeemachine"
export default class extends Controller {
  static targets = ["description", "readMore"];

  connect() {
    console.log("salam");

  }

  fire(event){
    const index = event.target.dataset.coffeemachineTarget;
    console.log(index);
    this.descriptionTargets[index].style.display= "block";
    this.readMoreTargets[index].style.display = "none";

  }
}
