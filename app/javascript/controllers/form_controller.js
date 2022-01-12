import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    //console.log("Hello from your first Stimulus controller");
  }

  static target = 'category';

  displayCategoryForm(event) {
    event.preventDefault();
    this.categoryTarget.classList.remove('d-none');
  }
}
