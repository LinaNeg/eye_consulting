import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    //console.log("Question Stimulus controller");
    console.log(this.questionTarget);

  }

  static targets = ['question'];

  display(event) {
    event.preventDefault();
    this.questionTarget.classList.remove('d-none');
  }
}
