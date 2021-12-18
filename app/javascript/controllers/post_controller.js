import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "heart", "heartFull"]
  
  
    like() {
        const heart = this.heartTarget
        const heart_full = this.heartFullTarget
        heart.classList.add("hidden")
        heart_full.classList.remove("hidden")
    }
}