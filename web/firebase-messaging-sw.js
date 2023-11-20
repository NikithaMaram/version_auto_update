importScripts("https://www.gstatic.com/firebasejs/8.4.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.4.1/firebase-messaging.js");

const firebaseConfig = {
   apiKey: "AIzaSyA8j5wqcU3SC1g1Me51Rh8Fyefb-nlripo",
   authDomain: "runo-call-crm.firebaseapp.com",
   databaseURL: "https://runo-call-crm.firebaseio.com",
   projectId: "runo-call-crm",
   storageBucket: "runo-call-crm.appspot.com",
   messagingSenderId: "6296723732",
   appId: "1:6296723732:web:74b0afd942818bc7a1a201",
   measurementId: "G-Z27YF3200K"
};

firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging();

messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);

    const notificationTitle = message.notification.title;
    const notificationOptions = {
      body: message.notification.body,
      icon: 'icons/playstore_logo.png',
    };

    self.registration.showNotification(notificationTitle, notificationOptions);
});