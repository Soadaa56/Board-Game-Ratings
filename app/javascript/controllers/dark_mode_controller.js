import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dark-mode"
export default class extends Controller {
  static targets = [ "button" ]

  connect() {
    const button = this.buttonTarget;

    // Check if dark mode is enabled so page loads dark mode
    if (localStorage.getItem('dark-mode') === 'enabled') {
      document.body.classList.add('dark-mode');
      button.innerHTML = 'Light Mode';
    }
  }

  toggleDarkMode(event) {
    event.preventDefault();
    const body = document.body;
    const button = this.buttonTarget;

    body.classList.toggle('dark-mode');

    if (document.body.classList.contains('dark-mode')) {
      localStorage.setItem('dark-mode', 'enabled');
      button.innerHTML = 'Light Mode';
    } else {
      localStorage.setItem('dark-mode', 'disabled');
      button.innerHTML = 'Dark Mode';
    }
  }
}
