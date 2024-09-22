import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';

class OurTerms extends StatelessWidget {
  const OurTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/hhotel.jpg'), fit: BoxFit.fill)),
            child: ListView(children: const [
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Text(ourTermsText,
                      style: TextStyle(fontSize: 15, color: Colors.white)))
            ])));
  }
}
