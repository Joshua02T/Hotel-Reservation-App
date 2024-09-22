// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';

class NavBar extends StatefulWidget {
  const NavBar(
      {super.key,
      required this.index,
      required this.v1,
      required this.v2,
      required this.name1,
      required this.name2});
  final int v1, v2, index;
  final String name1, name2;
  @override
  State<NavBar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget.index,
        onTap: (value) {
          setState(() {
            if (value == widget.v1) {
              Navigator.of(context).pushReplacementNamed(widget.name1);
            }
            if (value == widget.v2) {
              Navigator.of(context).pushReplacementNamed(widget.name2);
            }
          });
        },
        selectedItemColor: myorange,
        unselectedItemColor: const Color(0xFF555555),
        selectedFontSize: 20,
        selectedIconTheme: const IconThemeData(size: 35),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.meeting_room_outlined),
            label: "My Room",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: "Account",
          ),
        ]);
  }
}
