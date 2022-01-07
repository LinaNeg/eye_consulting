import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello from your first Stimulus controller");
    console.log(this.answerTarget);

  }

  static targets = ['category', 'question', 'answer'];

  displayCategoryForm(event) {
    event.preventDefault();
    this.categoryTarget.classList.remove('d-none');
  }

  displayQuestionForm(event) {
    event.preventDefault();
    this.questionTarget.classList.remove('d-none');
  }

  displayAnswerForm(event) {
    event.preventDefault();
    this.answerTarget.classList.remove('d-none');
  }
}
