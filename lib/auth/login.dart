import 'package:flutter/material.dart';
import 'package:hotel_app/components/emailfield.dart';
import 'package:hotel_app/components/loginbutton.dart';
import 'package:hotel_app/components/passwordfield.dart';
import 'package:hotel_app/core/consts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController _emailLogin = TextEditingController();
TextEditingController _passwordLogin = TextEditingController();

class _LoginState extends State<Login> {
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
                padding: const EdgeInsets.all(10),
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
                                      padding: EdgeInsets.only(top: 5)),
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
                            const SizedBox(height: 10),
                            const Text('Login',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: myorange)),
                            const Text('Login to continue using the app',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300)),
                            const SizedBox(height: 10),
                            const Text('Email',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500)),
                            EmailField(mycontoller: _emailLogin),
                            const SizedBox(height: 10),
                            const Text('Password',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500)),
                            PasswordField(mycontoller: _passwordLogin),
                            const SizedBox(height: 15),
                            Container(
                                margin: const EdgeInsets.only(right: 10),
                                alignment: Alignment.topRight,
                                child: const Text("Forgot your password?",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey))),
                            const SizedBox(height: 25),
                            Center(
                                child: SizedBox(
                                    height: 70,
                                    width: 300,
                                    child: LoginButton(
                                        myGlobalKey: form,
                                        emailController: _emailLogin,
                                        passwordController: _passwordLogin))),
                            const SizedBox(height: 30),
                            const Center(
                                child: Text('or login with ',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w500))),
                            const SizedBox(height: 10),
                            Center(
                                child: MaterialButton(
                                    height: 60,
                                    minWidth: 150,
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    onPressed: () {},
                                    child: const Text('facebook',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20)))),
                            const SizedBox(height: 25),
                            Center(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  const Text('don\'t have an account? ',
                                      style: TextStyle(fontSize: 16)),
                                  InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed('signup');
                                      },
                                      child: const Text('Sign up',
                                          style: TextStyle(
                                              color: myorange,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)))
                                ]))
                          ]))
                ]))));
  }
}
