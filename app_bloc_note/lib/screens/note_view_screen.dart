import 'dart:io';

import 'package:app_bloc_note/helper/note_provider.dart';
import 'package:app_bloc_note/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_routes.dart';
import '../models/note.dart';
import '../widgets/delete_popup.dart';

class NoteViewScreen extends StatefulWidget {
  const NoteViewScreen({Key? key}) : super(key: key);

  @override
  _NoteViewScreenState createState() => _NoteViewScreenState();
}

class _NoteViewScreenState extends State<NoteViewScreen> {
  late Note selectedNote;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (ModalRoute.of(context)!.settings.arguments != null) {
      final id =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    }

    final provider = Provider.of<NoteProvider>(context);
    if (provider.getNote(id!) != null) {
      selectedNote = provider.getNote(
          id!); //TODO : je n'arrive pas à récupérer en argument l'id pour récuperer la note
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0.7,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.black,
            ),
            onPressed: () => _showDialog(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                selectedNote?.title,
                style: viewTitleStyle,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.access_time,
                    size: 18,
                  ),
                ),
                Text('${selectedNote?.date}')
              ],
            ),
            if (selectedNote.imagePath != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.file(File(selectedNote.imagePath)),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                selectedNote.content,
                style: viewContentStyle,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, noteEditScreen,
              arguments: selectedNote.id);
        },
        child: Icon(Icons.edit),
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: this.context,
        builder: (context) {
          return DeletePopUp(selectedNote: selectedNote);
        });
  }
}
