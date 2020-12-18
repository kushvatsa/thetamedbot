import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:thetamedbot/models/myuser.dart';
import 'dart:io';

class FirebaseStoringClass {
  Future<String> uploadImageToFirebase(
      BuildContext context, File _image) async {
    String filename = basename(_image.path);
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child("diagnoses_images/$filename");

    firebase_storage.UploadTask uploadTask = storageReference.putFile(_image);
    return "diagnoses_images/$filename";
  }

  Future storeResultsCloudFirestore(AsyncSnapshot<MyUser> user, String img_file,
      String label, double accuracy) async {
    final databaseReference = FirebaseFirestore.instance;

    databaseReference
        .collection("Users_Diagnoses")
        .doc(user.data.uid)
        .collection("Image_Diagnoses")
        .doc(img_file)
        .set({
      "diagnose_prediction_result": accuracy * 100,
      "diagnose_result": label,
      "diagnose_type": "Skin Cancer",
      "image_id": "diagnoses_images/$img_file"
    });
  }
}
