import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thetamedbot/models/myuser.dart';
import 'firebase_storage/loading_firebase.dart';
import 'package:connectivity/connectivity.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key, @required this.userSnapshot});

  final AsyncSnapshot<MyUser> userSnapshot;
  FireBaseLoader _loader = FireBaseLoader();

  _HistoryPage createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: check(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data
                    ? widget._loader.load_history(widget.userSnapshot)
                    : Center(
                        child: Container(
                            width: 200,
                            height: 100,
                            child: Text(
                                "No Internet Connection, Please check your Wifi !",
                                style: GoogleFonts.abel(
                                    color: Colors.red[900],
                                    fontWeight: FontWeight.bold))));
              }
            }));
  }
}

class InformationCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [],
    ));
  }
}
