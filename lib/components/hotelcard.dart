// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';

Widget travelCard(String imgUrl, String roomNumber, int rating, String Class) {
  return Card(
      margin: const EdgeInsets.only(right: 15.0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 0.0,
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imgUrl), fit: BoxFit.fitHeight)),
          width: 190.0,
          child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        for (var i = 0; i < rating; i++)
                          const Icon(Icons.star, color: myorange),
                      ],
                    ),
                    Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text(
                            'Room Number: $roomNumber',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            '$Class Floor',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.5,
                                fontWeight: FontWeight.w300),
                          )
                        ]))
                  ]))));
}
