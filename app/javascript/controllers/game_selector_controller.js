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

  async fillForm(gameName, gameId) {
    const form = document.getElementById("new-post-form").elements;
    const formTitle = form["post_title"];
    const formId = form["post_bgg_id"];
    const formImageUrl = form["post_image_pin"];

    formTitle.value = gameName ? gameName : Null;
    formId.value = gameId ? gameId : Null;
    
    try {
      // I will return json with my BggDataFetcher so I have some experience with json
      const response = await fetch(`/posts/${gameId}/details`);
      const data = await response.json();

      formImageUrl.value = data.game_image_url;
      console.log(data);
      console.log(data.game_image_url);
    } catch (error) {
      console.error("Error getting game details", error);
    }
  }
}