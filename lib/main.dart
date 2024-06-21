import 'package:flutter/material.dart';
import 'package:recycling_app/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const App());
}