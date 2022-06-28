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
      decoration: const BoxDecoration(
          color: headerColor,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.0))),
      height: 25,
      width: 25,
      child: Text(
        'Accéder au répertoire GitHub en cliquant ici',
        style: headerRideStyle,
      ),
    ),
  );
}
