// src/controllers/clipboard_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "text" ]
  
  copy() {
    navigator.clipboard.writeText(window.location.href);
    const element = this.textTarget
    element.classList.remove("hidden")
    setInterval(function () { element.classList.add("hidden")}, 1500);
  }
}