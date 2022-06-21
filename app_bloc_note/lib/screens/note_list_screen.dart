import 'package:app_bloc_note/app_routes.dart';
import 'package:app_bloc_note/helper/note_provider.dart';
import 'package:app_bloc_note/widgets/list_item.dart';
import 'package:app_bloc_note/widgets/noNotes_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/header_widget.dart';

class NoteListScreen extends StatelessWidget {
  const NoteListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<NoteProvider>(context, listen: false).getNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
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
                      noteProvider.items.isEmpty
                          ? noNotes(context)
                          : ListView.builder(
                              itemCount: noteProvider.items.length + 1,
                              itemBuilder: (context, index) {
                                if (index==0){
                                  return header();
                                }else{
                                  final i = index-1;
                                  final item = noteProvider.items[i];
                                  return ListItem(item.id, item.title, item.content, item.imagePath, item.date);
                                }
                              }),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, noteEditScreen);
                  },
                  child: const Icon(Icons.add),
                ),
              );
            }
            return const SizedBox(
              width: 0.0,
              height: 0.0,
            );
          }
        });
  }

}
