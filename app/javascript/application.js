// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Application } from "@hotwired/stimulus"

import DarkModeController from "./controllers/dark_mode_controller.js"
import GameSelectorController from "./controllers/game_selector_controller.js"
import ModalsController from "./controllers/modals_controller.js"
import PostSortController from "./controllers/post_sort_controller.js"

window.Stimulus = Application.start();
Stimulus.register("dark-mode", DarkModeController)
Stimulus.register("game-selector", GameSelectorController)
Stimulus.register("modals", ModalsController)
Stimulus.register("post-sort", PostSortController)

// import "./controllers"
// import "jquery"
// import "trix"
// import "@rails/actiontext"
// import * as bootstrap from "bootstrap"
