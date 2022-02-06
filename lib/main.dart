import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_books_to_read/app/app.dart';
import 'package:my_books_to_read/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
