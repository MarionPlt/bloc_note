import 'package:app_bloc_note/app_routes.dart';
import 'package:app_bloc_note/helper/note_provider.dart';
import 'package:app_bloc_note/screens/note_edit_screen.dart';
import 'package:app_bloc_note/screens/note_list_screen.dart';
import 'package:app_bloc_note/screens/note_view_screen.dart';
import 'package:app_bloc_note/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: NoteProvider(),
      child: MaterialApp(
        title: "Flutter bloc note",
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: appRoutes,
      ),
    );
  }
}
