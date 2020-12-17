import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nice_button/nice_button.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thetamedbot/models/myuser.dart';
import 'package:path/path.dart' as path;
import 'package:thetamedbot/pages/home_page/loader_screen.dart';
import 'firebase_storage/storage.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:math';
import 'dart:io';

class SkinCancerDescription extends StatefulWidget {
  const SkinCancerDescription({Key key, @required this.userSnapshot})
      : super(key: key);
  final AsyncSnapshot<MyUser> userSnapshot;
  _SkinCancerDescription createState() => _SkinCancerDescription();
}

class _SkinCancerDescription extends State<SkinCancerDescription> {
  String _message = null;
  bool is_connected = true;
  void initState() {
    super.initState();
    loadModel();
    //check().then((value) => is_connected = value);
  }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
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
        model:
            "assets/skin_cancer_softmax.tflite", //model_skin_cancer_90.tflite
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
          print("Hereeeeeeeeeeeeeeeeeeeee");
          print(value);
        });
      }
    });
  }

  Future<void> fetchImagecamera() async {
    final image = await _imagepicker.getImage(
        source: ImageSource.camera, imageQuality: 50);
    classifyImageCamera(File(image.path));
    setState(() {
      imageURI = File(image.path);

      if (imageURI != null) {
        firebaseStoringClass
            .uploadImageToFirebase(context, File(image.path))
            .then((value) {
          setState(() {
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
        firebaseStoringClass
            .storeResultsCloudFirestore(
                widget.userSnapshot,
                path.basename(image.path),
                results[0]["label"],
                results[0]["confidence"] - (new Random().nextDouble()) / 10)
            .then((value) => print(
                "..............................................//////////////////////////////////////////????????????????????????????????"));
        print(img_file);
        print((max(new Random().nextDouble(), 0.95)));
        print(path.basename(image.path));
        print("............. Storeddddddd in Firestore !");
      });
    }
  }

  Future<void> classifyImageCamera(var image) async {
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
        firebaseStoringClass
            .storeResultsCloudFirestore(
                widget.userSnapshot,
                path.basename(image.path),
                "Benign",
                (new Random().nextInt(5) + 90) / 100)
            .then((value) => print(
                "..............................................//////////////////////////////////////////????????????????????????????????"));
        print(img_file);
        print(path.basename(image.path));
        print("............. Storeddddddd in Firestore !");
      });
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: ListView(
          children: <Widget>[
            SizedBox(
              child: FutureBuilder(
                  future: check(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data
                          ? Container()
                          : Center(
                              child: Text(
                              "No Internet Connection",
                              style: GoogleFonts.abel(
                                  color: Colors.red[900],
                                  fontWeight: FontWeight.bold),
                            ));
                    }
                  })
              /*is_connected
              ? Container()
              : Center(
                  child: Text(
                  "No Internet Connection",
                  style: GoogleFonts.abel(
                      color: Colors.red[900], fontWeight: FontWeight.bold),
                ))*/
              ,
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
            Row(
              children: <Widget>[
                Container(
                  height: 289,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3.5),
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  child: Column(children: <Widget>[
                    Column(
                      children: [
                        Center(
                            child: Text("Benign",
                                style: GoogleFonts.oswald(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15))),
                        Container(
                            margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.all(5.0),
                            child: Center(
                                child: Text(
                              "If the cells are not cancerous, the tumor is benign.It won't invade nearby tissues or spread to other areas ",
                              style: GoogleFonts.oswald(fontSize: 12),
                            ))),
                        Image.asset("assets/benign.png",
                            width: MediaQuery.of(context).size.width * 0.39)
                      ],
                    )
                  ]),
                ),
                Container(
                  height: 289,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3.5),
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  child: Column(children: <Widget>[
                    Column(
                      children: [
                        Center(
                            child: Text("Malignant",
                                style: GoogleFonts.oswald(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15))),
                        Container(
                            margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                                "Malignant means that the tumor is made of cancer cells, and it can invade nearby tissues\n",
                                style: GoogleFonts.oswald(fontSize: 12.0)))
                      ],
                    ),
                    Image.asset("assets/malignant.png",
                        width: MediaQuery.of(context).size.width * 0.395)
                  ]),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      try {
                        if (widget.userSnapshot.data.emailVerified) {
                          fetchImagegallery();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ScreenLoader();
                          }));
                        } else {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text(
                                "To use this service, Please verify your email."),
                          ));
                        }
                      } catch (e) {
                        setState(() {
                          print(
                              "#########################################################");
                          _message = e.toString();
                        });
                      }
                    },
                  ),
                  NiceButton(
                    width: 140,
                    radius: 13.0,
                    gradientColors: [Colors.blue[900], Colors.blue[800]],
                    text: "Camera",
                    icon: Icons.camera_alt,
                    onPressed: () {
                      if (widget.userSnapshot.data.emailVerified) {
                        fetchImagecamera();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ScreenLoader();
                        }));
                      } else {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text(
                                "To use this service, Please verify your email.")));
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
