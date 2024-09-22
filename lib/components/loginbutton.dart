// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';

class LoginButton extends StatefulWidget {
  final GlobalKey<FormState> myGlobalKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginButton(
      {super.key,
      required this.myGlobalKey,
      required this.emailController,
      required this.passwordController});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

bool isLoading = false;

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          if (widget.myGlobalKey.currentState!.validate()) {
            setState(() {
              isLoading = true;
            });
            try {
              await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: widget.emailController.text,
                  password: widget.passwordController.text);
              Navigator.pushReplacementNamed(context, 'homepage');
              setState(() {
                isLoading = false;
              });
            } on FirebaseAuthException catch (e) {
              setState(() {
                isLoading = false;
              });
              if (e.code == 'user-not-found') {
                AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.bottomSlide,
                        title: 'Error',
                        desc: 'User Not Found!')
                    .show();
              } else if (e.code == 'wrong-password') {
                AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.bottomSlide,
                        title: 'Wrong Password',
                        desc:
                            'Are you sure that is the password you have saved?')
                    .show();
              }
            }
          }
        },
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(myorange)),
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white, strokeAlign: 2)
            : const Text('Log in',
                style: TextStyle(color: Colors.white, fontSize: 35)));
  }
}
