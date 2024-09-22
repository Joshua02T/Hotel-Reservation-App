import 'package:about/about.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: AboutPage(
            applicationIcon: FlutterLogo(
              size: 100,
            ),
            applicationLegalese: 'Copyright © {{ Joshua }}, {{ 2024 }}',
            children: <Widget>[
          MarkdownPageListTile(
            filename: 'README.md',
            title: Text('View Readme'),
            icon: Icon(Icons.all_inclusive, color: myorange),
          ),
          MarkdownPageListTile(
            filename: 'CHANGELOG.md',
            title: Text('View Changelog'),
            icon: Icon(Icons.view_list, color: myorange),
          ),
          MarkdownPageListTile(
            filename: 'LICENSE.md',
            title: Text('View License'),
            icon: Icon(Icons.description, color: myorange),
          ),
          MarkdownPageListTile(
            filename: 'CONTRIBUTING.md',
            title: Text('Contributing'),
            icon: Icon(Icons.share, color: myorange),
          ),
          MarkdownPageListTile(
            filename: 'CODE_OF_CONDUCT.md',
            title: Text('Code of conduct'),
            icon: Icon(Icons.sentiment_satisfied, color: myorange),
          ),
          LicensesPageListTile(
              title: Text('Open source Licenses'),
              icon: Icon(Icons.favorite, color: myorange))
        ]));
  }
}
