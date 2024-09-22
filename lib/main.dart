import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/view/aboutus.dart';
import 'package:hotel_app/view/account.dart';
import 'package:hotel_app/auth/login.dart';
import 'package:hotel_app/auth/signup.dart';
import 'package:hotel_app/view/homepage.dart';
import 'package:hotel_app/view/myroom.dart';
import 'package:hotel_app/view/ourterms.dart';
import 'package:hotel_app/view/request.dart';
import 'package:hotel_app/view/security.dart';
import 'package:hotel_app/view/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('=========User is currently signed out!');
      } else {
        print('===========User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const Splash(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, fontFamily: "Rubik"),
        routes: {
          'account': (context) => const Account(),
          'login': (context) => const Login(),
          'signup': (context) => const Signup(),
          'myroom': (context) => MyRoom(),
          'security': (context) => const SecurityNotifications(),
          'request': (context) => const RequestAccInfo(),
          'ourterms': (context) => const OurTerms(),
          'aboutus': (context) => const AboutUs(),
          'homepage': (context) => const HomePage()
        });
  }
}
