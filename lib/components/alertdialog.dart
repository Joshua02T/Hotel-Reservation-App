// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title, content, wheretogo;
  const CustomAlertDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.wheretogo});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shadowColor: myorange,
      title: Text(title),
      actionsAlignment: MainAxisAlignment.spaceAround,
      content: Text(content),
      actions: [
        MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () async {
              if (wheretogo == 'request') {
                Navigator.pop(context);
              } else if (wheretogo == 'login') {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  wheretogo,
                  (route) => false,
                );
              } else {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  wheretogo,
                  (route) => false,
                );
              }
            },
            color: myorange,
            textColor: Colors.white,
            child: const Text('Yes')),
        MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side:
                    const BorderSide(color: Color.fromARGB(255, 255, 152, 69))),
            onPressed: () {
              Navigator.pop(context);
            },
            textColor: myorange,
            child: const Text('Cancel'))
      ],
    );
  }
}
