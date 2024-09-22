// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hotel_app/core/bottomsheetcontainer.dart';
import 'package:hotel_app/core/consts.dart';
import 'package:hotel_app/core/lists.dart';

class RoomDetails extends StatefulWidget {
  final data;
  const RoomDetails({super.key, this.data});
  @override
  State<RoomDetails> createState() => _RoomDetails();
}

class _RoomDetails extends State<RoomDetails> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [orangeGradient, Colors.white])),
            child: ListView(children: [
              Image.asset(widget.data['image']),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Room Number ${widget.data['roomNumber']}',
                            style: const TextStyle(fontSize: 30)),
                        Row(children: [
                          for (var i = 0; i < widget.data['starNumber']; i++)
                            const Icon(Icons.star, color: myorange),
                          Text(
                            '  (${widget.data['reviews']} reviews)',
                            style: const TextStyle(
                                fontSize: 17, color: Colors.grey),
                          )
                        ]),
                        const SizedBox(height: 5),
                        Row(children: [
                          const Icon(Icons.location_on, color: Colors.grey),
                          Text(' ${widget.data['floor']} floor',
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 117, 117, 117)))
                        ]),
                        const SizedBox(height: 20),
                        const Text('Amenities:',
                            style: TextStyle(fontSize: 30, letterSpacing: 2)),
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
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        width: 75,
                                        height: 75,
                                        child: Icon(amenities[index]['icon'],
                                            size: 40,
                                            color: amenities[index]['color'])),
                                    Text(amenities[index]['text'],
                                        style: const TextStyle(fontSize: 17))
                                  ]);
                                })),
                        const SizedBox(height: 70),
                        Center(
                            child: Column(children: [
                          MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              onPressed: () {
                                scaffoldkey.currentState!.showBottomSheet(
                                    (context) => ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                                        child: BottomSheetContainer(
                                            data: widget.data)));
                              },
                              minWidth: 300,
                              height: 80,
                              textColor: Colors.white,
                              color: myorange,
                              child: const Text('Book',
                                  style: TextStyle(fontSize: 30))),
                          const SizedBox(height: 30),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('\$${widget.data['cost']}',
                                    style: const TextStyle(
                                        color: mypurple,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                const Text('/night',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 98, 98, 98)))
                              ])
                        ]))
                      ]))
            ])));
  }
}
