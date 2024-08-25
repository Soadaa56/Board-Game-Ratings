// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import "jquery"
import "trix"
import "@rails/actiontext"

// Stopped custom controllers from loading and wasn't being loaded anyway. config/importmap pinning did not fix.
// import * as bootstrap from "bootstrap"
