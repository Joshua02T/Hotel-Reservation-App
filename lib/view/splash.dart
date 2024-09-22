import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      (FirebaseAuth.instance.currentUser != null)
          ? Navigator.pushReplacementNamed(context, 'homepage')
          : Navigator.pushReplacementNamed(context, 'login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('welcome your',
          style: TextStyle(fontSize: 40, wordSpacing: 7, letterSpacing: 4)),
      const Text('HOTEL',
          style: TextStyle(
              fontSize: 40,
              color: myorange,
              letterSpacing: 4,
              fontWeight: FontWeight.bold)),
      Container(
          color: Colors.blue,
          width: double.infinity,
          height: 150,
          child: Lottie.asset('lottie/hhotel.json',
              frameRate: const FrameRate(60), reverse: true, fit: BoxFit.cover))
    ])));
  }
}
