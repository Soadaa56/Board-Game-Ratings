# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"

# causing a bunch of 404 errors in console
# pin "bootstrap" # @5.3.3
# pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8


# Possibly unneeded, testing with commented out
# pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
# pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.1/dist/jquery.js"
# pin_all_from "app/javascript/controllers", under: "controllers"
