import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  final _picker = ImagePicker();
  XFile? _image;
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Add Screen"),
        actions: [
          CupertinoButton(child: const Icon(CupertinoIcons.add), onPressed: () {})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Add image to your post"),
            const SizedBox(height: 20),
            _image == null ? InkWell(
              onTap: () async {
                _image = await _picker.pickImage(source: ImageSource.gallery);
                setState(() {

                });
              },
              child: Container(
                 width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black,width: 2)
                ),
                child: const Icon(CupertinoIcons.photo_camera),
              ),
            ) : CircleAvatar(radius: 50,foregroundImage: FileImage(File(_image?.path ?? "")),),
            const SizedBox(height: 30),
            Text('Write text to your post',style: GoogleFonts.roboto(fontSize: 20,color: Colors.black)),
            const SizedBox(height: 10),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Text',
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black,width: 2)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.indigoAccent,width: 2)
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black,width: 2)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
