import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game-selector"
export default class extends Controller {
  connect() {
    console.log("game_selector connected");
  }

  select(event) {
    event.preventDefault();

    console.log(event);
  }
}
