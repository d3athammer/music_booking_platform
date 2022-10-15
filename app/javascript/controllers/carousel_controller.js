import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  connect() {
    super.connect()
    console.log('Do what you want here.')

    // The swiper instance.
    this.swiper

    // Default options for every carousels.
    this.defaultOptions
  }

  // You can set default options in this getter.
  get defaultOptions() {
    return {
      // Your default options here
    }
  }
  }
