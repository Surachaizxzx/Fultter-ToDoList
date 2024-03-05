import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboading_screen/screen/signin_screen.dart';

import '../components/my_button.dart';
import '../components/my_textformfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailControllor = TextEditingController();

  final nameControllor = TextEditingController();

  final passwordControllor = TextEditingController();

  final repasswordControllor = TextEditingController();

  signUpWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailControllor.text,
        password: passwordControllor.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      _showMyDialog('สมัครไปทำไมไปดรอปสะ');
    } catch (e) {
      print(e);
    }
  }

  void _showMyDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            backgroundColor: Colors.amberAccent,
            title: const Text('AlertDialog Title'),
            content: Text(txtMsg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to our community",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(238, 210, 152, 25),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\nTo get started please provide your information to create and ancount\n",
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal,
                    color: const Color.fromARGB(255, 172, 168, 152),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  MytextField(
                    Controller: nameControllor,
                    hintText: "Enter your name",
                    obscureText: false,
                    labelText: "Name",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MytextField(
                    Controller: emailControllor,
                    hintText: "Enter your Email",
                    obscureText: false,
                    labelText: "Email",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MytextField(
                    Controller: passwordControllor,
                    hintText: "Enter your password",
                    obscureText: true,
                    labelText: "Password",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MytextField(
                    Controller: repasswordControllor,
                    hintText: "Enter your password again",
                    obscureText: true,
                    labelText: "Re-password",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Mybutton(onTap: signUpWithEmailAndPassword, hinText: "Sign Up"),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Have a member ?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                    );
                  },
                  child: const Text("Sign In"),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
