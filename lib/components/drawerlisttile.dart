import 'package:flutter/material.dart';
import 'package:hotel_app/components/alertdialog.dart';
import 'package:hotel_app/core/consts.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {super.key,
      required this.icon,
      required this.text,
      required this.wheretogo});
  final IconData icon;
  final String text;
  final String wheretogo;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          icon,
          color: myorange,
        ),
        title: Text(
          text,
          style: const TextStyle(fontSize: 22),
        ),
        onTap: () => (wheretogo == 'login')
            ? showDialog(
                context: context,
                builder: ((context) => const CustomAlertDialog(
                    title: 'Confirm Logout',
                    content: 'are you sure you want to logout?',
                    wheretogo: 'login')),
              )
            : wheretogo == 'homepage'
                ? Navigator.pop(context)
                : Navigator.pushNamed(context, wheretogo));
  }
}
