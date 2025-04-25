import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_app_rami/presentation/screens/create_note_screen.dart';
import 'package:note_app_rami/presentation/screens/home_screen.dart';
import 'package:note_app_rami/presentation/screens/login_screen.dart';
import 'package:note_app_rami/presentation/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<bool> checkLoginStatus() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final logged = await prefs.getBool('logged');
  return logged!;}


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'note_app_rami',
        home: checkLoginStatus == true ? HomeScreen() : LoginScreen (),
        debugShowCheckedModeBanner: false,

    );
  }
}
