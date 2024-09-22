import 'package:flutter/material.dart';
import 'package:hotel_app/components/alertdialog.dart';
import 'package:hotel_app/core/consts.dart';

class RequestAccInfo extends StatelessWidget {
  const RequestAccInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Request Account Info',
                style: TextStyle(fontWeight: FontWeight.bold))),
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [orangeGradient, Colors.white])),
            child: ListView(children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: myorange,
                                    borderRadius: BorderRadius.circular(60)),
                                child: const Icon(Icons.request_page_rounded,
                                    color: Colors.white, size: 50))),
                        const SizedBox(height: 30),
                        const Text(requestText1,
                            style: TextStyle(fontSize: 18)),
                        const SizedBox(height: 20),
                        const Divider(height: 5, indent: 10, endIndent: 10),
                        ListTile(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (builder) => const CustomAlertDialog(
                                      title: 'Requesting Report',
                                      content:
                                          'don\'t delete or modify your account information otherwise requesting report will be canceled!',
                                      wheretogo: 'request'));
                            },
                            leading: const Icon(Icons.contact_page_outlined,
                                color: myorange, size: 30),
                            title: const Text('Request Report',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        const Divider(height: 5, indent: 10, endIndent: 10),
                        const SizedBox(height: 10),
                        const Text(requestText2, style: TextStyle(fontSize: 18))
                      ]))
            ])));
  }
}
