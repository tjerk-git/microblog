import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect(){
      new SimpleMDE({ element: document.getElementById("simplemde") });
    }
}