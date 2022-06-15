import 'package:app_bloc_note/app_routes.dart';
import 'package:app_bloc_note/helper/note_provider.dart';
import 'package:app_bloc_note/widgets/noNotes_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteListScreen extends StatelessWidget {
  const NoteListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<NoteProvider>(context, listen: false).getNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              return Scaffold(
                body: Consumer<NoteProvider>(
                  child: noNotes(context),
                  builder: (context, noteProvider, child) =>
                      noteProvider.items.length <= 0 ? noNotes(context) : Container(),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, noteEditScreen);
                  },
                  child: Icon(Icons.add),
                ),
              );
            }
            return Container(
              width: 0.0,
              height: 0.0,
            );
          }
        });
  }
}
