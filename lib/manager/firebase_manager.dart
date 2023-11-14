import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FirebaseManager {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseDatabase.instance;
  final _storage = FirebaseStorage.instance;

  User? getUser() {
    return _auth.currentUser;
  }

  Future<String> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'Success';
    } on FirebaseAuthException catch(e) {
      return "Error";
    }
  }
  Future<String> register(
      String username,
      String email,
      String password,
      File image /// dart:io dan bo'sin qo'qchar!
      ) async {
    try {
      final fileName = DateTime.now().microsecondsSinceEpoch;
      final uploadTask = await _storage.ref('user_images/$fileName').putFile(image);
      final imageUri = await uploadTask.ref.getDownloadURL();
      final user =
       await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final newUser = {
        'uid': user.user?.uid,
        'username': username,
        'password': password,
        'image': imageUri
      };
      final id = _db.ref('users').push().key;
      await _db.ref('users/$id').set(newUser);
      return 'Success';
    } catch(e) {
      debugPrint(e.toString());
      return 'Error';
    }
  }
}