import 'package:app_bloc_note/data/models/note.dart';
import 'package:app_bloc_note/data/providers/note_cache_provider.dart';

class NoteRepository {
  final NoteCacheProvider _cache = NoteCacheProvider();

  addNote(Note note) async {
    await _cache.insert(note);
  }

  Future<List<Note>> getAllNotes() async {
    return await _cache.getAll();
  }
}
