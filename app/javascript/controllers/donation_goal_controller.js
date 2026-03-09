import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["radio", "otherRadio", "customAmount", "customInput"]

  select(event) {
    this.customAmountTarget.classList.add("hidden")
  }

  selectOther(event) {
    this.customAmountTarget.classList.remove("hidden")
    this.customInputTarget.focus()
  }
}
