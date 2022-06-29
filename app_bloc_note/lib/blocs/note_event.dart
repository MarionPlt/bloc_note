import 'package:equatable/equatable.dart';

import '../models/note.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class GetAllNotesEvent extends NoteEvent {
  @override
  List<Object> get props => [];
}

class SaveNoteEvent extends NoteEvent {
  final Note note;

  const SaveNoteEvent({required this.note});

  @override
  List<Object> get props => [note];
}

class DeleteNoteEvent extends NoteEvent {
  final int noteId;

  const DeleteNoteEvent({required this.noteId});

  @override
  List<Object> get props => [noteId];
}
