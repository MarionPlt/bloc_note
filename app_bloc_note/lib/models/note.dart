import 'package:intl/intl.dart';

class Note {
  int _id;
  String _title;
  String _content;
  String _imagePath;

  Note(this._id, this._title, this._content, this._imagePath);

  String get imagePath => _imagePath;

  String get content => _content;

  String get title => _title;

  int get id => _id;

  String get date {
    final date = DateTime.fromMillisecondsSinceEpoch(id);
    return DateFormat('EEE h:mm a, dd/MM/yyyy').format(date);
  }
}
