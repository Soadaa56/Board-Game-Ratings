// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "trix"
// import "@rails/actiontext"
// import "jquery"
// import "./controllers"
// import * as bootstrap from "bootstrap"

import { Application } from "@hotwired/stimulus"

import DarkModeController from "./controllers/dark_mode_controller.js"
import GameSelectorController from "./controllers/game_selector_controller.js"
import ModalsController from "./controllers/modals_controller.js"
import PostSortController from "./controllers/post_sort_controller.js"

const application = Application.start();
application.register("dark-mode", DarkModeController)
application.register("game-selector", GameSelectorController)
application.register("modals", ModalsController)
application.register("post-sort", PostSortController)
