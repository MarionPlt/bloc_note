import 'package:app_bloc_note/data/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NoteCacheProvider {
  Database? db;

  Future initialiseDatabase() async {
    var databasePath = await getDatabasesPath();

    db = await openDatabase(join(databasePath, 'notes_databse.db'), version: 1,
        onCreate: (database, version) {
      return database.execute('''CREATE TABLE notes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            content TEXT NOT NULL,
            imagePath TEXT NOT NULL,
            date INTEGER NOT NULL)
          ''');
    });
  }

  Future<Note> insert(Note note) async {
    await initialiseDatabase();
    var newId = await db!.insert('notes', note.toJson());
    return Note(
        id: newId,
        title: note.title,
        content: note.content,
        imagePath: note.imagePath,
        date: note.date);
  }

  Future<List<Note>> getAll() async {
    await initialiseDatabase();
    var result = await db!.query('notes');
    return result.map((e) => Note.fromJson(e)).toList();
  }
}
