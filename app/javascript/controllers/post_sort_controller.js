import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post-sort"
export default class extends Controller {
  static targets = ["select"];
  connect() {
    console.log("post-sort controller connected");
  }

  update() {
    this.sortPosts();
  }

  sortPosts() {
    const sortBy = this.selectTarget.value;
    const url = `/posts?sort_by=${sortBy}`;

    Turbo.visit(url);
  }
}
