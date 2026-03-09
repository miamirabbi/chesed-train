import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["radio", "otherRadio", "customAmount", "customInput"]

  select(event) {
    // Hide custom amount field
    this.customAmountTarget.classList.add("hidden")
    
    // Check the radio button
    const radio = event.currentTarget.querySelector('input[type="radio"]')
    if (radio) {
      radio.checked = true
    }
    
    // Update visual state
    this.element.querySelectorAll('label').forEach(label => {
      label.classList.remove('border-secondary')
      label.classList.add('border-transparent')
    })
    event.currentTarget.classList.remove('border-transparent')
    event.currentTarget.classList.add('border-secondary')
  }

  selectOther(event) {
    // Show custom amount field
    this.customAmountTarget.classList.remove("hidden")
    this.customInputTarget.focus()
    
    // Update visual state
    this.element.querySelectorAll('label').forEach(label => {
      label.classList.remove('border-secondary')
      label.classList.add('border-transparent')
    })
    event.currentTarget.classList.remove('border-transparent')
    event.currentTarget.classList.add('border-secondary')
  }
}
