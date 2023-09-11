import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="research"
export default class extends Controller {
  static targets = [ "minPrice", "maxPrice" ]

  minPrice() {
    if (this.minPriceTarget.value * 1 > this.maxPriceTarget.value * 1) {
      this.minPriceTarget.value = this.maxPriceTarget.value
    }
  }

  maxPrice() {
    if (this.maxPriceTarget.value * 1 < this.minPriceTarget.value * 1) {
      this.maxPriceTarget.value = this.minPriceTarget.value
    }
  }

}
