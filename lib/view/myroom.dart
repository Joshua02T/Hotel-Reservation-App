import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';
import 'package:hotel_app/core/myroombottomsheet.dart';
import 'package:hotel_app/core/navbaritems.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyRoom extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  MyRoom({super.key});
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  Future<bool> checkUserReservationExists() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      QuerySnapshot snapshot = await _firestore
          .collection('reservations')
          .doc(user.uid)
          .collection('userReservations')
          .limit(1)
          .get();
      return snapshot.docs.isNotEmpty;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        bottomNavigationBar: const NavBar(
            index: 1, v1: 2, v2: 0, name1: 'account', name2: 'homepage'),
        body: FutureBuilder<bool>(
            future: checkUserReservationExists(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (snapshot.data == true) {
                return ListView(children: [
                  const SizedBox(height: 10),
                  const Center(
                      child: Text(
                    'Congrats! you have been booked a nice room!',
                    style: TextStyle(fontSize: 17),
                  )),
                  const SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      end: Alignment.centerRight,
                                      begin: Alignment.centerLeft,
                                      colors: [orangeGradient, Colors.white]),
                                  border: Border.all(color: myorange, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text(myroomtext,
                                  style: TextStyle(fontSize: 17))))),
                  const SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Center(
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                      color: mypurple, width: 2)),
                              onPressed: () {
                                scaffoldkey.currentState!.showBottomSheet(
                                    (context) => const ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30)),
                                        child: MyRoomBottomSheetContainer()));
                              },
                              minWidth: 300,
                              height: 50,
                              textColor: Colors.white,
                              color: myorange,
                              child: const Text('Show Details',
                                  style: TextStyle(fontSize: 22)))))
                ]);
              } else {
                return const Center(
                    child: Text("you haven't booked any room yet!",
                        style: TextStyle(fontSize: 17)));
              }
            }));
  }
}
