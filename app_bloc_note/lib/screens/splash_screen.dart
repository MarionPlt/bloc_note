import 'package:flutter/material.dart';
import 'package:app_bloc_note/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              InkWell(
                onTap: () { Navigator.pushNamed(context, noteListScreen);
                },
                child: Image.asset('assets/images/chocobo.jpg')
              ),
              Text(
                "Flutter Bloc Note",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              )
            ])),
      ),
    );
  }
}
