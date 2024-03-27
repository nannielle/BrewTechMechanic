import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slide", "dot"];

  connect() {
    this.slideIndex = 0;
    this.showSlides();
    setInterval(()=>{
    const activeEllement = this.slideTargets.filter(slide => getComputedStyle(slide).display == "block" )[0]
    const nextIndex = parseInt(activeEllement.dataset.index , 10) + 1

    activeEllement.style.display = "none"
    if (nextIndex > 3){
      this.slideTargets[0].style.display = "block"
    }else {
      this.slideTargets[nextIndex].style.display = "block"

    }


  }

    ,8000)
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
