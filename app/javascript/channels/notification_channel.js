import consumer from "channels/consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {
    console.log("connected to notifications channel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    this.displayNotification(data)
  },

  displayNotification(data) {
    // if (!("Notification" in window)) {
    //   console.warn("This browser does not support desktop notification");
    // } else if (Notification.permission === "granted") {
    //   console.log("notification granted");
    //   var notification = new Notification(data.title, { body: `shared by ${data.author}` });
    // } else if (Notification.permission !== "denied") {
    //   console.log("notification permissions need to be requested");
    // } else {
    //   console.warn("notification denied");
    // }
    console.log("receive data")

    const notification = document.getElementById('notifications');
    notification.innerText = `${data.title}  \n shared by ${data.author}`;

    const toast = document.getElementById('liveToast');

    setTimeout(() => {
      console.log(toast)
      toast.classList.remove('hide');
      toast.classList.add('show');
  
      // Hide the notification after another 5 seconds
      setTimeout(() => {
        toast.classList.remove('show');
        toast.classList.add('hide');
      }, 8000); // 8 seconds
    }, 1000); // 1 seconds
  },
});
