import 'package:equatable/equatable.dart';

import '../models/note.dart';

abstract class NoteState extends Equatable {
  const NoteState();
}

class InitialNoteState extends NoteState {
  @override
  List<Object> get props => [];
}

class NoteListLoadingState extends NoteState {
  @override
  List<Object> get props => [];
}

class NoteListSuccessState extends NoteState {
  final List<Note> notes;

  const NoteListSuccessState(this.notes);

  @override
  List<Object> get props => [notes];
}

class NoteListErrorState extends NoteState {
  final String error;

  const NoteListErrorState(this.error);

  @override
  List<Object> get props => [error];
}
