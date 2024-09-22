// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';

class SignUpButton extends StatefulWidget {
  final GlobalKey<FormState> myGlobalKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const SignUpButton(
      {super.key,
      required this.myGlobalKey,
      required this.emailController,
      required this.passwordController});

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

bool isLoading = false;

class _SignUpButtonState extends State<SignUpButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () async {
          widget.myGlobalKey.currentState!.save();
          if (widget.myGlobalKey.currentState!.validate()) {
            setState(() {
              isLoading = true;
            });
            try {
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: widget.emailController.text,
                password: widget.passwordController.text,
              );
              Navigator.pushReplacementNamed(context, 'homepage');
              setState(() {
                isLoading = false;
              });
            } on FirebaseAuthException catch (e) {
              setState(() {
                isLoading = false;
              });
              if (e.code == 'weak-password') {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.bottomSlide,
                  title: 'Weak Password',
                  desc: 'Password provided is too weak!',
                ).show();
              } else if (e.code == 'email-already-in-use') {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.bottomSlide,
                  title: 'Email Already in use',
                  desc: 'Account already exists for that email!',
                ).show();
              }
            } catch (e) {
              setState(() {
                isLoading = false;
              });
              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.bottomSlide,
                title: 'An Unexpected Error!',
                desc: '$e',
              ).show();
            }
          }
        },
        minWidth: 240,
        height: 60,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        textColor: Colors.white,
        color: myorange,
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white, strokeAlign: 2)
            : const Text('Register', style: TextStyle(fontSize: 25)));
  }
}
