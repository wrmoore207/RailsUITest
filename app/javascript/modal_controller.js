// modal_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  open(event) {
    event.preventDefault()
    const date = event.currentTarget.dataset.date
    fetch(`/calendar/events_on_date?date=${date}`, {
      headers: { Accept: "text/vnd.turbo-stream.html" }
    })
      .then(response => response.text())
      .then(html => Turbo.renderStreamMessage(html))
  }

  close(event) {
    event.preventDefault()
    document.getElementById("modal").innerHTML = ""
  }
}
