import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slideshow"
export default class extends Controller {
  // app/javascript/controllers/slideshow_controller.js
  static targets = ["slide", "dot"];

  connect() {
    this.slideIndex = 0;
    this.showSlides();
  }

  currentSlide(event) {
    this.showSlides(event.target.getAttribute("data-slide-index"));
  }

  showSlides(n = 0) {
    let slides = this.slideTargets;
    let dots = this.dotTargets;

    if (n >= slides.length) {
      this.slideIndex = 0;
    } else if (n < 0) {
      this.slideIndex = slides.length - 1;
    } else {
      this.slideIndex = n;
    }

    slides.forEach((slide) => (slide.style.display = "none"));
    dots.forEach((dot) => dot.classList.remove("active"));

    slides[this.slideIndex].style.display = "block";
    dots[this.slideIndex].classList.add("active");
  }
}
