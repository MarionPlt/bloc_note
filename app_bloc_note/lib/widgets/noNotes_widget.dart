import 'package:app_bloc_note/app_routes.dart';
import 'package:app_bloc_note/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget noNotes(BuildContext context) {
  return ListView(
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Image.asset(
              'assets/images/chocobo2.jpg',
            ),
          ),
          RichText(
              text: TextSpan(style: noNotesStyle, children: [
            TextSpan(text: 'Oups! Aucune note disponible! \nTape sur '),
            TextSpan(
                text: '+',
                style: boldPlus,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, noteEditScreen);
                  }),
            TextSpan(text: ' pour ajouter une note')
          ]))
        ],
      )
    ],
  );
}
