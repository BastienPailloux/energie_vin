import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bottles"
export default class extends Controller {
  static targets = ["newReview", "star", "rate"]

  connect() {
  }

  displayForm() {
    this.newReviewTarget.classList.toggle("d-none")
  }

  fillStars = (rating) => {
    this.starTargets.forEach((star) => {
      if (star.id <= rating) {
        star.classList.add("fa-solid")
        star.classList.remove("fa-regular")
      }
    })
  }

  emptyStars = () => {
    var selected = 0
    if (document.querySelector('.selected')) {
      selected = document.querySelector('.selected').id
    }
    this.starTargets.forEach((star) => {
      if (star.id > selected) {
        star.classList.remove("fa-solid")
        star.classList.add("fa-regular")
      }
    })
  }

  updateRatingInputForm(rating) {
    const formInput = document.getElementById('rating_rate')
    formInput.value = rating
  }

  updateRate(e) {
    if (document.querySelector('.selected')) {
      document.querySelectorAll('.selected').forEach((e) => {
        e.classList.remove("selected")
      })
    }
    const rating = e.target.id;
    this.updateRatingInputForm(rating);
    this.fillStars(rating);
    e.target.classList.add("selected")
  }

  mouseOver(e) {
    const rating = e.target.id;
    this.fillStars(rating);
  }

  mouseOut(e) {
    this.emptyStars()
  }

}
