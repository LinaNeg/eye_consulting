import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    //console.log("Answer Stimulus controller");
    //console.log(this.answerTarget);

  }

  static targets = ['answer'];

  display(event) {
    event.preventDefault();
    this.answerTarget.classList.remove('d-none');
  }
}
