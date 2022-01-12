import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log(this.categoryTarget);
  }

  static targets = ['category'];

  displayCategoryForm(event) {
    event.preventDefault();
    this.categoryTarget.classList.remove('d-none');
  }
}
