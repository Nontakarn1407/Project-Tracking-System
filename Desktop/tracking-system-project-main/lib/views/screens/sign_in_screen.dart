import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/user_model.dart';
import 'package:flutter_application_4/views/screens/home_screen.dart';
import 'package:flutter_application_4/views/screens/sing_up_screen.dart';
import 'package:flutter_application_4/views/widgets/dialogs/error-dialog.dart';
import 'package:flutter_application_4/views/widgets/dialogs/loading-dialog.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  UserModel userModel = UserModel();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onPressSignIn() async {
      showDialog(
          context: context,
          builder: (BuildContext context) => const LoadingDialog());

      String email = _emailController.text;
      String password = _passwordController.text;

      UserCredential? user =
          await userModel.singInWithEmailAndPassword(email, password);

      if (user != null && context.mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        Timer(const Duration(seconds: 2), () {
          Navigator.pop(context, true);
          showDialog(
              context: context,
              builder: (BuildContext context) => const ErrorDialog(
                    title: 'Invalid Email or Password.',
                  ));
        });
      }
    }

    void onPressGoToSignUpScreen() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()));
    }

    return Scaffold(
        body: Stack(
      children: [
        // Background Image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/backgrounds/sign_in_bg.jpg'), // Add your image asset here
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Content
        Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  'ลงชื่อเข้าใช้งาน'),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 320,
                height: 50,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey[500],
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: Colors.grey[500], fontWeight: FontWeight.w300),
                      fillColor: Colors.grey[500],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.white),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 320,
                height: 50,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.key,
                        color: Colors.grey[500],
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: Colors.grey[500], fontWeight: FontWeight.w300),
                      fillColor: Colors.grey[500],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.white),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: 320,
                child: FilledButton(
                  onPressed: onPressSignIn,
                  child: const Text(
                    "Let's Go",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Text(
                    'ยังไม่มีบัญชีใช่หรือไม่?',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: onPressGoToSignUpScreen,
                    child: Text(
                      'ลงทะเบียน',
                      style: TextStyle(
                          color: Colors.yellow[800],
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                  )
                ],
              )
            ],
          )
        ])
      ],
    ));
  }
}
