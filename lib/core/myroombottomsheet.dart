import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';
import 'package:hotel_app/core/gradient.dart';
import 'package:hotel_app/core/lists.dart';

class MyRoomBottomSheetContainer extends StatefulWidget {
  const MyRoomBottomSheetContainer({super.key});

  @override
  State<MyRoomBottomSheetContainer> createState() =>
      _MyRoomBottomSheetContainerState();
}

class _MyRoomBottomSheetContainerState
    extends State<MyRoomBottomSheetContainer> {
  int totalCalc() {
    if (datadatabase[0]['discount'] == 0) {
      return (datadatabase[0]['cost'] +
              datadatabase[0]['servicefee'] +
              datadatabase[0]['taxes'])
          .toInt();
    } else {
      return ((datadatabase[0]['cost'] +
                  datadatabase[0]['servicefee'] +
                  datadatabase[0]['taxes']) -
              ((datadatabase[0]['cost'] +
                          datadatabase[0]['servicefee'] +
                          datadatabase[0]['taxes']) *
                      datadatabase[0]['discount']) /
                  100)
          .toInt();
    }
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<QueryDocumentSnapshot> datadatabase = [];
  Future<void> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      QuerySnapshot querySnapshot = await _firestore
          .collection('reservations')
          .doc(user.uid)
          .collection('userReservations')
          .get();

      datadatabase.clear();

      datadatabase.addAll(querySnapshot.docs);
      setState(() {});
    }
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return datadatabase.isNotEmpty
        ? Container(
            decoration: customBoxDecoration(),
            width: double.infinity,
            height: 600,
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Dear ${datadatabase[0]['name']}',
                          style: const TextStyle(fontSize: 26)),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.cancel_rounded,
                              color: mypurple, size: 20))
                    ],
                  ),
                  Text(
                      'room number ${datadatabase[0]['roomnumber']} has been booked for',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('${datadatabase[0]['firstday']}',
                            style: const TextStyle(fontSize: 20)),
                        const SizedBox(
                            width: 60,
                            child: Divider(thickness: 3, color: myorange)),
                        Text('${datadatabase[0]['lastday']}',
                            style: const TextStyle(fontSize: 20))
                      ]),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Number of people',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                        Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                color: myorange,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                                    '${datadatabase[0]['numberofpeople']}',
                                    style: const TextStyle(fontSize: 24)))),
                      ]),
                  const Text('Amenities',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  SizedBox(
                      height: 120,
                      child: ListView.builder(
                          itemCount: amenities.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(children: [
                              Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: amenities[index]['Ccolor'],
                                      borderRadius: BorderRadius.circular(25)),
                                  width: 75,
                                  height: 75,
                                  child: Icon(amenities[index]['icon'],
                                      size: 40,
                                      color: amenities[index]['color'])),
                              Text(amenities[index]['text'],
                                  style: const TextStyle(fontSize: 17))
                            ]);
                          })),
                  const SizedBox(height: 10),
                  const Text('Room Details',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('booked days',
                            style: TextStyle(fontSize: 19)),
                        Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text('${datadatabase[0]['bookeddays']}',
                                style: const TextStyle(
                                    fontSize: 19,
                                    color: mypurple,
                                    fontWeight: FontWeight.bold)))
                      ]),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Base fare', style: TextStyle(fontSize: 19)),
                        Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text('\$${datadatabase[0]['cost']}',
                                style: const TextStyle(
                                    fontSize: 19,
                                    color: mypurple,
                                    fontWeight: FontWeight.bold)))
                      ]),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Discount', style: TextStyle(fontSize: 19)),
                        Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text('%${datadatabase[0]['discount']}',
                                style: const TextStyle(
                                    fontSize: 19,
                                    color: mypurple,
                                    fontWeight: FontWeight.bold)))
                      ]),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Taxes', style: TextStyle(fontSize: 19)),
                        Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text('\$${datadatabase[0]['taxes']}',
                                style: const TextStyle(
                                    fontSize: 19,
                                    color: mypurple,
                                    fontWeight: FontWeight.bold)))
                      ]),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Service fee',
                            style: TextStyle(fontSize: 19)),
                        Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text('\$${datadatabase[0]['servicefee']}',
                                style: const TextStyle(
                                    fontSize: 19,
                                    color: mypurple,
                                    fontWeight: FontWeight.bold)))
                      ]),
                  const SizedBox(height: 20),
                  const Divider(color: Colors.black),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold)),
                        Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text('\$${totalCalc()}',
                                style: const TextStyle(
                                    fontSize: 19,
                                    color: mypurple,
                                    fontWeight: FontWeight.bold)))
                      ]),
                ],
              ),
            ),
          )
        : const Text(
            'Loading...',
            style: TextStyle(fontWeight: FontWeight.bold),
          );
  }
}
