import 'package:flutter/material.dart';
import 'package:onboading_screen/screen/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); //รอให้เชื่อต่อfirebase

  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING ') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter on Boarding',
      theme: ThemeData.light(),
      home: SignInScreen(),
      // home: show ? IntroScreen() : SignInScreen(),
    );
  }
}
