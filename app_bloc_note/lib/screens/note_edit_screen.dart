import 'package:app_bloc_note/app_routes.dart';
import 'package:app_bloc_note/helper/note_provider.dart';
import 'package:app_bloc_note/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class NoteEditScreen extends StatefulWidget {
  const NoteEditScreen({Key? key}) : super(key: key);

  @override
  _NoteEditScreenState createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  XFile? _image;
  final picker = ImagePicker();

  void getImage(ImageSource imageSource) async {
    XFile? imageFile = await picker.pickImage(
      source: imageSource,
    );
    if (imageFile == null) return;

    setState(() {
      _image = imageFile;
    });
  }

  void saveNote() {
    String title = titleController.text.trim();
    String content = contentController.text.trim();
    String? imagePath = _image != null ? _image!.path : '';
    int id = DateTime.now().millisecondsSinceEpoch;
    Provider.of<NoteProvider>(this.context, listen: false)
        .addOrUpdateNote(id, title, content, imagePath, EditMode.ADD);
    Navigator.of(this.context)
        .pushReplacementNamed(noteViewScreen, arguments: id);
  }

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
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              getImage(ImageSource.camera);
            },
            icon: const Icon(Icons.photo_camera),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {
              getImage(ImageSource.gallery);
            },
            icon: const Icon(Icons.insert_photo),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 5.0, top: 10.0, bottom: 5.0),
            child: TextField(
              controller: titleController,
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
              style: createTitle,
              decoration: const InputDecoration(
                  hintText: 'Titre de la note', border: InputBorder.none),
            ),
          ),
          if (_image != null)
            Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              height: 250.0,
              child: Stack(
                children: [
                  Image.asset(_image!.path),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _image = null;
                            });
                          },
                          child: const Icon(
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
              decoration: const InputDecoration(
                  hintText: 'Le contenu de la note', border: InputBorder.none),
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isEmpty) {
            titleController.text = 'Note_SansTitre';
          }
          saveNote();
        },
        child: const Icon(Icons.save),
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
