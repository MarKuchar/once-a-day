import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';
import firebase from 'firebase';


// src="https://www.gstatic.com/firebasejs/8.2.2/firebase-app.js"
// src="https://www.gstatic.com/firebasejs/8.2.2/firebase-analytics.js"

var firebaseConfig = {
  apiKey: "AIzaSyDiII45yK8LTQfgleDNDDgJzFi2RwswZyY",
  authDomain: "one-step-ef751.firebaseapp.com",
  databaseURL: "https://one-step-ef751-default-rtdb.firebaseio.com",
  projectId: "one-step-ef751",
  storageBucket: "one-step-ef751.appspot.com",
  messagingSenderId: "683490190062",
  appId: "1:683490190062:web:b330fa2aef0a6ab095c9ff",
  measurementId: "G-2V6QPVWKWF"
};

firebase.initializeApp(firebaseConfig);
firebase.analytics();


ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
