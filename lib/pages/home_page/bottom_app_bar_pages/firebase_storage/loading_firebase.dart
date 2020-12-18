import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:thetamedbot/models/myuser.dart';

class FireBaseLoader {
  Future<Widget> _getImage(BuildContext context, String image_id) async {
    Image m;

    FirebaseStorage.instance
        .ref()
        .child(image_id)
        .getDownloadURL()
        .then((downloadUrl) {
      m = Image.network(
        downloadUrl.toString(),
        fit: BoxFit.scaleDown,
      );
    });
    return m;
  }

  Widget load_history(AsyncSnapshot<MyUser> user) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Users_Diagnoses")
            .doc(user.data.uid)
            .collection("Image_Diagnoses")
            .snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(
                  child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ))
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, itemCount) {
                    return Container(
                      height: 230,
                      width: 150,
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        FutureBuilder(
                          builder: (context, snapshot) {
                            print(snapshot.data.toString());
                            return Image.network(snapshot.data.toString(),
                                width: 180, height: 150);
                          },
                          future: FirebaseStorage.instance
                              .ref()
                              .child(snapshot.data.documents[itemCount]
                                  ["image_id"])
                              .getDownloadURL(),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("\t\tResult: " +
                                  snapshot.data
                                      .documents[itemCount]["diagnose_result"]
                                      .toString() +
                                  "\n\t\tAccuracy: " +
                                  snapshot
                                      .data
                                      .documents[itemCount]
                                          ["diagnose_prediction_result"]
                                      .toStringAsFixed(3))
                            ])
                      ]),
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border.all(width: 5.0, color: Colors.black)),
                    );
                  });
        });
  }

  Widget getImageNetwork(String img_id) {
    print(img_id);

    var ref = FirebaseStorage.instance.ref().child(img_id);
    var url;
    ref.getDownloadURL().then((value) {
      url = value;
    });
    return url == null
        ? CircularProgressIndicator(
            backgroundColor: Colors.blue[900],
          )
        : Image.network(url.toString(), width: 100);
  }

  String getImageURL(String img_id) {
    var ref = FirebaseStorage.instance.ref().child(img_id);
    var url;
    ref.getDownloadURL().then((value) {
      url = value;
    });
  }
}
