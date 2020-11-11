import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nice_button/nice_button.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thetamedbot/models/myuser.dart';
import 'package:path/path.dart' as path;
import 'firebase_storage/storage.dart';
import 'dart:io';

class SkinCancerDescription extends StatefulWidget {
  const SkinCancerDescription({Key key, @required this.userSnapshot})
      : super(key: key);
  final AsyncSnapshot<MyUser> userSnapshot;
  _SkinCancerDescription createState() => _SkinCancerDescription();
}

class _SkinCancerDescription extends State<SkinCancerDescription> {
  void initState() {
    super.initState();
    loadModel();
  }

  var imageURI;
  FirebaseStoringClass firebaseStoringClass = FirebaseStoringClass();
  String img_file;
  double accuracy;
  String result;

  final ImagePicker _imagepicker = ImagePicker();
  String res;
  void loadModel() async {
    await Tflite.loadModel(
        model: "assets/skin_cancer_softmax.tflite",
        labels: "assets/labels_skin_cancer.txt");
  }

  Future<void> fetchImagegallery() async {
    final image = await _imagepicker.getImage(source: ImageSource.gallery);
    classifyImage(File(image.path));
    setState(() {
      imageURI = File(image.path);

      if (imageURI != null) {
        firebaseStoringClass
            .uploadImageToFirebase(context, File(image.path))
            .then((value) {
          print(value);
        });
      }
    });
  }

  Future<void> fetchImagecamera() async {
    final image = await _imagepicker.getImage(
        source: ImageSource.camera, imageQuality: 50);
    classifyImage(File(image.path));
    setState(() {
      imageURI = File(image.path);

      if (imageURI != null) {
        firebaseStoringClass
            .uploadImageToFirebase(context, File(image.path))
            .then((value) {
              setState((){
          img_file = value;
          print("///////////////////////////////////////");
          print(value);
              });
        });
      }
    });
  }

  Future<void> classifyImage(var image) async {
    print(image.path);

    if (image.path != null) {
      final List results = await Tflite.runModelOnImage(
        numResults: 1,
        path: image.path,
      );

      print(results);
      print(results[0]["label"]);
      setState(() {
        this.res = results[0]["label"];
        firebaseStoringClass.storeResultsCloudFirestore(widget.userSnapshot,
            path.basename(image.path), results[0]["label"], results[0]["confidence"]).then((value) => print("..............................................//////////////////////////////////////////????????????????????????????????"));
            print(img_file);
            print(path.basename(image.path));
            print("............. Storeddddddd in Firestore !");
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Center(
          child: Text("Make Diagnosis As Easy As Taking A Picture",
              style: GoogleFonts.oswald(
                  fontSize: 19.0, fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          child: Text(
              "Skin cancer — the abnormal growth of skin cells — most often develops on skin exposed to the sun. But this common form of cancer can also occur on areas of your skin not ordinarily exposed to sunlight.\n\n In order to quickly diaognize either your skin or your patients' skins are infected or not with cancer, We offer a Deep Learning powered solution to predict such anomaly by analyzing the provided skin image "),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NiceButton(
                width: 140,
                radius: 13.0,
                gradientColors: [Colors.blue[900], Colors.blue[800]],
                text: "Gallery",
                icon: Icons.image,
                onPressed: () {
                  fetchImagegallery();
                },
              ),
              NiceButton(
                width: 140,
                radius: 13.0,
                gradientColors: [Colors.blue[900], Colors.blue[800]],
                text: "Camera",
                icon: Icons.camera_alt,
                onPressed: () {
                  fetchImagecamera();
                },
              )
            ],
          ),
        )
      ],
    ));
  }
}
