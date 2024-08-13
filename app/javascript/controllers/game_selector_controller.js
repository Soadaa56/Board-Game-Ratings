import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game-selector"
export default class extends Controller {
  static targets = [ "game" ]
  connect() {  }

  select(event) {
    event.preventDefault();

    const boardGame = this.gameTarget;
    const gameName = boardGame.dataset.gameName;
    const gameId = boardGame.dataset.gameId;

    this.fillForm(gameName, gameId);
  }

  fillForm(gameName, gameId) {
    const form = document.getElementById("new-post-form").elements;
    const formTitle = form["post_title"];
    const formId = form["post_bgg_id"];

    formTitle.value = gameName ? gameName : Null;
    formId.value = gameId ? gameId : Null;
    console.log(form);
  }
}
document.querySelector("body > main > div > div.row.align-items-start > div:nth-child(1) > form")