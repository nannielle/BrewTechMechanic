import { Controller } from "stimulus";

export default class extends Controller {
  connect(){
console.log("salam");
  }
  toggleMenu() {
    const navbarMenu = this.element.querySelector('.navbar-menu');
    navbarMenu.classList.toggle('show');
    console.log("salam");
  }
}
