import 'package:app_bloc_note/helper/database_helper.dart';
import 'package:app_bloc_note/models/note.dart';
import 'package:flutter/material.dart';

class NoteProvider with ChangeNotifier {
  List _items = [];

  List get items {
    return [..._items];
  }

  Future getNotes() async {
    final noteslist = await DatabaseHelper.getNotesFromDB();

    _items = noteslist
        .map(
          (item) => Note(
              item['id'], item['title'], item['content'], item['imagePath']),
        )
        .toList();
    notifyListeners();
  }
}
