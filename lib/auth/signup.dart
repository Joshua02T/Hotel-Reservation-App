import 'package:flutter/material.dart';
import 'package:hotel_app/components/emailfield.dart';
import 'package:hotel_app/components/passwordwithconfrirm.dart';
import 'package:hotel_app/components/signupbutton.dart';
import 'package:hotel_app/components/usernamefield.dart';
import 'package:hotel_app/core/consts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

TextEditingController _emailSignup = TextEditingController();
TextEditingController _passwordSignup = TextEditingController();

class _SignupState extends State<Signup> {
  GlobalKey<FormState> form = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [orangeGradient, Colors.white])),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ListView(children: [
                  Form(
                      key: form,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                  const Padding(
                                      padding: EdgeInsets.only(top: 40)),
                                  Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 234, 234, 234),
                                          borderRadius:
                                              BorderRadius.circular(120)),
                                      width: 130,
                                      height: 130,
                                      child: Image.asset("images/hhhhotel.png"))
                                ])),
                            const SizedBox(height: 5),
                            const Text('Register',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: myorange)),
                            const Text('Signup to continue using the app',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300)),
                            const SizedBox(height: 10),
                            const Text('Username',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500)),
                            const UsernameField(),
                            const Text('Email',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500)),
                            EmailField(mycontoller: _emailSignup),
                            PassWithConfrim(mycontoller: _passwordSignup),
                            const SizedBox(height: 10),
                            Center(
                                child: SignUpButton(
                                    myGlobalKey: form,
                                    emailController: _emailSignup,
                                    passwordController: _passwordSignup)),
                            const SizedBox(height: 10),
                            Center(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  const Text('have an account? ',
                                      style: TextStyle(fontSize: 16)),
                                  InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed('login');
                                      },
                                      child: const Text('Log in',
                                          style: TextStyle(
                                              color: myorange,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)))
                                ]))
                          ]))
                ]))));
  }
}
