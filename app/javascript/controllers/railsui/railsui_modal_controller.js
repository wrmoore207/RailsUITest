import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { url: String, name: String }

  open(event) {
    event.preventDefault()
    console.log("✅ railsui-modal#open fired!")

    const frame = document.querySelector(`turbo-frame#${this.nameValue}`)
    if (frame && this.urlValue) {
      frame.src = this.urlValue
    } else {
      console.warn("⚠️ Missing modal frame or URL")
    }
  }

  close(event) {
    event.preventDefault()
    const frame = document.getElementById(this.nameValue)
    if (frame) {
      frame.innerHTML = ""
    }
  }
}