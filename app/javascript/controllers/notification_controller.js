import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notification"
export default class extends Controller {
  connect() {
  }

  requestPermission() {
    console.log("requesting permission");
    Notification.requestPermission().then(function (permission) {
      if (permission === "granted") {
        new Notification("Hi there!");
      }
    });
  }
}
