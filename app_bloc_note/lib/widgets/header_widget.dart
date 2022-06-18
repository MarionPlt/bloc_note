import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/constants.dart';

getOnRepoGit() async {
  final Uri url = Uri.parse('https://github.com/MarionJS/bloc_note');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch url';
  }
}

Widget header() {
  return GestureDetector(
    onTap: () {
      getOnRepoGit();
    },
    child: Container(
      decoration: BoxDecoration(
          color: headerColor,
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      height: 50,
      width: 75,
      child: Text(
        'Repo GitHub',
        style: headerRideStyle,
      ),
    ),
  );
}
