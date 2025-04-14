import 'package:flutter/material.dart';
import 'package:note_app_rami/presentation/screens/sign_up_screen.dart';

import 'presentation/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'note_app_rami',
        home: LoginScreen(),
    );
  }
}
