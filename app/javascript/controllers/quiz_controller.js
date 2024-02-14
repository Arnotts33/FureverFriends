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
        question.classList.add('active');

      } else {
        question.classList.remove('active');
        question.style.display = "none";
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

  updateColor(event) {
    console.log(event)
    //if (this.choiceTarget.classList.contains("bg-red")) {
      event.currentTarget.classList.add("bg-red");
    //} else {
      //this.choiceTarget.classList.remove("bg-red");
    //}
  }
}
