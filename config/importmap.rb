# Pin npm packages by running ./bin/importmap
pin "application", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.1/dist/stimulus.js"
pin "@rails/actioncable", to: "https://ga.jspm.io/npm:@rails/actioncable@7.1.1/app/assets/javascripts/actioncable.esm.js"
pin "@rails/activestorage", to: "https://ga.jspm.io/npm:@rails/activestorage@7.1.1/app/assets/javascripts/activestorage.esm.js"
pin "@rails/actiontext", to: "https://ga.jspm.io/npm:@rails/actiontext@7.1.1/app/assets/javascripts/actiontext.esm.js"
pin "trix", to: "https://ga.jspm.io/npm:trix@2.0.7/dist/trix.esm.js"
pin_all_from "app/javascript/controllers", under: "controllers", to: "controllers"
