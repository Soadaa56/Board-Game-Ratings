import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game-selector"
export default class extends Controller {
  connect() { }

  select(event) {
    event.preventDefault();
    console.log("hi")
    console.log(event);
  }
}
