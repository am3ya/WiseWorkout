import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAWCUNezfylaSCaK13StoYVtLBZOCaAIAw",
            authDomain: "wise-workout-jep57d.firebaseapp.com",
            projectId: "wise-workout-jep57d",
            storageBucket: "wise-workout-jep57d.appspot.com",
            messagingSenderId: "692770947303",
            appId: "1:692770947303:web:06e29eb4324611ab616242"));
  } else {
    await Firebase.initializeApp();
  }
}
