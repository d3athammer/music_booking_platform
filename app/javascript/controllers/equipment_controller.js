import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="equipment"
export default class extends Controller {
  static targets = ["fields"]

  connect() {
    console.log('equipment controller connected')
  }

  addEquipment(event) {
    console.log('addEquipment clicked')

    const time = new Date().getTime();
    const regexp = new RegExp(event.target.dataset.id, 'g');
    this.fieldsTarget.insertAdjacentHTML('beforeend', event.target.dataset.fields.replace(regexp, time));

    return event.preventDefault();
  }

  removeEquipment(event) {
    console.log('removeEquipment clicked')

    event.target.previousElementSibling.value = "1"
    event.target.closest('tr').style.display = "none"
    return event.preventDefault();
  }
}
