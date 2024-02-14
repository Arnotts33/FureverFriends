import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["question", "submitButton", "nextButton"];
  static values = { currentIndex: Number };

  connect() {
    this.currentIndexValue = 0;
    this.showCurrentQuestion();
  }

  showCurrentQuestion() {
    this.questionTargets.forEach((question, index) => {
      if (index === this.currentIndexValue) {
        question.style.display = "block";
        setTimeout(() => {
          question.classList.add('active');
        }, 300);
      } else {
        question.classList.remove('active');
        setTimeout(() => {
          question.style.display = "none";
        }, 300);
      }
    });

    if (this.currentIndexValue === this.questionTargets.length - 1) {
      this.submitButtonTarget.style.display = "block";
      this.nextButtonTarget.style.display = "none";
    } else {
      this.submitButtonTarget.style.display = "none";
      this.nextButtonTarget.style.display = "block";
    }
  }

  onNextButtonClick() {
    if (this.currentIndexValue < this.questionTargets.length - 1) {
      this.currentIndexValue++;
      this.showCurrentQuestion();
    }
  }
}
