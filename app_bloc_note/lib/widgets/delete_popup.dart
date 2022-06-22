import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/note_provider.dart';
import '../models/note.dart';

class DeletePopUp extends StatelessWidget {
  const DeletePopUp({
    Key? key,
    required this.selectedNote,
  }) : super(key: key);

  final Note selectedNote;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      title: const Text('Supprimer?'),
      content: const Text('Voulez-vous supprimer cette note?'),
      actions: [
        TextButton(
          child: const Text('Oui'),
          onPressed: () {
            Provider.of<NoteProvider>(context, listen: false)
                .deleteNote(selectedNote.id);
            Navigator.popUntil(context, ModalRoute.withName('/note-list'));
          },
        ),
        TextButton(
          child: const Text('Non'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
