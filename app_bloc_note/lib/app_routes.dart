import 'package:app_bloc_note/screens/note_edit_screen.dart';
import 'package:app_bloc_note/screens/note_list_screen.dart';
import 'package:app_bloc_note/screens/note_view_screen.dart';
import 'package:app_bloc_note/screens/splash_screen.dart';
import 'package:flutter/material.dart';


const splashScreen = '/';
const noteListScreen = '/note-list';
const noteEditScreen = '/edit-note';
const noteViewScreen = '/note-view';

Map<String, WidgetBuilder> appRoutes = {
  splashScreen: (context) => const SplashScreen(),
  noteListScreen: (context) => NoteListScreen(),
  noteEditScreen: (context) => NoteEditScreen(),
  noteViewScreen: (context) => NoteViewScreen(),
};