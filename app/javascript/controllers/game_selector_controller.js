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
    const formDescription = form["post_body"];
    const formId = form["post_bgg_id"];
    const formImageUrl = form["post_image_pin"];
    const formThumbnailUrl = form["post_thumbnail"];

    formTitle.value = gameName ? gameName : Null;
    formId.value = gameId ? gameId : Null;
    
    try {
      // I will return json with my BggDataFetcher so I have some experience with json
      const response = await fetch(`/posts/${gameId}/details`);
      const data = await response.json();
      const game_data_array = data[0];

      // Add info to form
      formDescription.value = game_data_array.game_description;
      formImageUrl.value = game_data_array.game_image_url;
      formThumbnailUrl.value = game_data_array.game_thumbnail_url;

      // Add image below form
      const gameImage = document.getElementById("game-image");
      gameImage.src = game_data_array.game_thumbnail_url;
      gameImage.style.display = "block";
    } catch (error) {
      console.error("Error getting game details", error);
    }
  }
}