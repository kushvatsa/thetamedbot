import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'dart:io';

class FirebaseStoringClass {
  Future uploadImageToFirebase(BuildContext context, File _image)async {
    String filename = basename(_image.path);
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child("diagnoses_images/$filename");
    firebase_storage.UploadTask uploadTask=storageReference.putFile(_image);
    //firebase_storage.TaskSnapshot taskSnapshot=await uploadTask.whenComplete(() => null);
    //uploadTask.w
    var url=await storageReference.getDownloadURL().then((value) => print("Upload Done"));

  }
  
}
