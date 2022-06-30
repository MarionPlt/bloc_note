import 'package:intl/intl.dart';

class Note {
  Note(
      {this.id,
      required this.title,
      required this.content,
      required this.imagePath,
      required this.date});
  int? id;
  final String title;
  final String content;
  final String imagePath;
  final DateTime date;

  factory Note.fromJson(Map<String, dynamic> json) {
    int? id = json['id'];
    String title = json['title'];
    String content = json['content'];
    String imagePath = json['imagePath'];
    DateTime date = DateTime.fromMillisecondsSinceEpoch(json['date']);

    return Note(
        id: id,
        title: title,
        content: content,
        imagePath: imagePath,
        date: date);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'imagePath': imagePath,
      'date': date.microsecondsSinceEpoch
    };
  }
}
