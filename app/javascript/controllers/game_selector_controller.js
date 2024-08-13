import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game-selector"
export default class extends Controller {
  static targets = [ "game" ]
  connect() {  }

  select(event) {
    event.preventDefault();

    const boardGame = this.gameTarget
    const gameName = boardGame.dataset.gameName
    const gameId = boardGame.dataset.gameId


    console.log(gameName);
    console.log(gameId);
  }
}
