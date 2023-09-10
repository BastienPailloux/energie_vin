import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bottles"
export default class extends Controller {
  static targets = ["newReview"]

  displayForm() {
    this.newReviewTarget.classList.toggle("d-none")
  }

}
