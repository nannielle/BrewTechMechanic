import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slide", "dot"];

  connect() {
    this.slideIndex = 0;
    this.showSlides();

    const numSlides = this.slideTargets.length;

    setInterval(()=>{
    const activeEllement = this.slideTargets.filter(slide => getComputedStyle(slide).display == "block" )[0]
    const nextIndex = parseInt(activeEllement.dataset.index , 10) + 1
    activeEllement.style.display = "none"
    if (nextIndex >= numSlides){
      this.slideTargets[0].style.display = "block"
      this.dotTargets.forEach(dot => dot.classList.remove("active"));
      this.dotTargets[0].classList.add("active");

    }else {
      this.slideTargets[nextIndex].style.display = "block"
      this.dotTargets.forEach(dot => dot.classList.remove("active"));
      this.dotTargets[nextIndex].classList.add("active");


    }

  }

    ,7000)
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
