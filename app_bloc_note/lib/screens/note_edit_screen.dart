import 'dart:io';
import 'package:app_bloc_note/utils/constants.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class NoteEditScreen extends StatefulWidget {
  const NoteEditScreen({Key? key}) : super(key: key);

  @override
  _NoteEditScreenState createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  late File _image; //TODO revoir initialisation File
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0.7,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {}, //getImage(ImageSource.camera),
            icon: Icon(Icons.photo_camera),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {}, // getImage(ImageSource.gallery),
            icon: Icon(Icons.insert_photo),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.delete),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding:
                EdgeInsets.only(left: 10.0, right: 5.0, top: 10.0, bottom: 5.0),
            child: TextField(
              controller: titleController,
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
              style: createTitle,
              decoration: InputDecoration(
                  hintText: 'Titre de la note', border: InputBorder.none),
            ),
          ),
          if (_image != null)
            Container(
              padding: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              height: 250.0,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                            image: FileImage(_image), fit: BoxFit.cover)),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _image = _image.delete(recursive: false)
                                  as File; //TODO revoir nullable du File
                            });
                          },
                          child: Icon(
                            Icons.delete,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 5.0, bottom: 5.0, top: 10.0),
            child: TextField(
              controller: contentController,
              maxLines: null,
              style: createContent,
              decoration: InputDecoration(
                  hintText: 'Le contenu de la note', border: InputBorder.none),
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isEmpty)
            titleController.text = 'Note_SansTitre';
          // saveNote();
        },
        child: Icon(Icons.save),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}
