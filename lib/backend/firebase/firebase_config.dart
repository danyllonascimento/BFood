import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAfCo68N0uPsQDqhjfiaNoIRt6J6JmgHLk",
            authDomain: "food-mesa-f122za.firebaseapp.com",
            projectId: "food-mesa-f122za",
            storageBucket: "food-mesa-f122za.appspot.com",
            messagingSenderId: "701956644196",
            appId: "1:701956644196:web:2fe28fd76a74ed09a96e71"));
  } else {
    await Firebase.initializeApp();
  }
}
