import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';

class SecurityNotifications extends StatefulWidget {
  const SecurityNotifications({super.key});

  @override
  State<SecurityNotifications> createState() => _SecurityNotificationsState();
}

class _SecurityNotificationsState extends State<SecurityNotifications> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Security Notifications',
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
                                child: const Icon(Icons.lock_person_rounded,
                                    color: Colors.white, size: 40))),
                        const SizedBox(height: 30),
                        const Text(sectext, style: TextStyle(fontSize: 17)),
                        const ListTile(
                          leading: Icon(Icons.message, color: myorange),
                          title: Text('Text messages with customer service'),
                        ),
                        const ListTile(
                            leading: Icon(Icons.call, color: myorange),
                            title: Text('Audio calls with customer service')),
                        const ListTile(
                            leading: Icon(Icons.file_upload_outlined,
                                color: myorange),
                            title: Text('Documents uploading')),
                        const ListTile(
                            leading: Icon(Icons.location_on, color: myorange),
                            title: Text('Location sharing')),
                        const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Phone & WhatsApp: 0944876334',
                                style: TextStyle(fontSize: 15))),
                        const Divider(height: 15),
                        SwitchListTile(
                            activeColor: myorange,
                            title: const Text(
                                'Show security notifications on this device',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19)),
                            value: status,
                            onChanged: (val) {
                              setState(() {
                                status = val;
                              });
                            }),
                        const Text(secnotificationtext,
                            style: TextStyle(fontSize: 17))
                      ]))
            ])));
  }
}
