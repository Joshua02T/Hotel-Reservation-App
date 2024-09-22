import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';

class TravelCard extends StatefulWidget {
  final String imgurl, roomNumber, classs;
  final int rating;
  const TravelCard(
      {super.key,
      required this.imgurl,
      required this.roomNumber,
      required this.classs,
      required this.rating});

  @override
  State<TravelCard> createState() => _TravelCardState();
}

class _TravelCardState extends State<TravelCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(right: 15.0),
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        elevation: 0.0,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.imgurl), fit: BoxFit.fitHeight)),
            width: 190.0,
            child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          for (var i = 0; i < widget.rating; i++)
                            const Icon(Icons.star, color: myorange),
                        ],
                      ),
                      Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(
                              'Room Number: ${widget.roomNumber}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text('${widget.classs} Floor',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w300))
                          ]))
                    ]))));
  }
}
