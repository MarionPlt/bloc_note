import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/note.dart';
import 'note_event.dart';
import 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(InitialNoteState()) {}
}
