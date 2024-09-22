// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';
import 'package:hotel_app/core/navbaritems.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> _deleteUserAccount(BuildContext context) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        String uid = user.uid;

        // Reference to the user's document in the 'reservations' collection
        DocumentReference reservationDocRef =
            _firestore.collection('reservations').doc(uid);

        // Delete the document in the 'reservations' collection
        await reservationDocRef.delete();

        // Delete the user's account
        await user.delete();

        // Sign the user out
        await _auth.signOut();

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Account and reservation deleted successfully.')));

        // Navigate to login screen
        Navigator.of(context).pushReplacementNamed('login');
      }
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error deleting account: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Account',
                style: TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: true),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(children: [
              ListTile(
                  onTap: () => Navigator.of(context).pushNamed('security'),
                  leading:
                      const Icon(Icons.security, color: myorange, size: 30),
                  title: const Text(
                    'Security notifications',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  )),
              const SizedBox(height: 8),
              ListTile(
                  onTap: () => Navigator.of(context).pushNamed('request'),
                  leading:
                      const Icon(Icons.request_page, color: myorange, size: 30),
                  title: const Text('Requset account info',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20))),
              const SizedBox(height: 8),
              ListTile(
                  leading: const Icon(Icons.delete, color: myorange, size: 30),
                  title: const Text('Delete account',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              shadowColor: myorange,
                              title: const Text('Delete Account'),
                              actionsAlignment: MainAxisAlignment.spaceAround,
                              content: const Text(
                                  'are you sure you want to delete this account ?'),
                              actions: [
                                MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    onPressed: () {
                                      _deleteUserAccount(context);
                                    },
                                    color: myorange,
                                    textColor: Colors.white,
                                    child: const Text('Yes')),
                                MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 255, 152, 69))),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    textColor: myorange,
                                    child: const Text('Cancel'))
                              ])))
            ])),
        bottomNavigationBar: const NavBar(
            index: 2, v1: 0, v2: 1, name1: 'homepage', name2: 'myroom'));
  }
}
