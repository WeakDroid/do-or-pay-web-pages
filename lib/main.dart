import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'application/application.dart';
import 'firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const DoOrPayWebApp(),
  );
}
