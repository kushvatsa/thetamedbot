import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_storage/loading_firebase.dart';
import '../../../models/myuser.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key, @required this.userSnapshot});

  final AsyncSnapshot<MyUser> userSnapshot;
  FireBaseLoader _loader = FireBaseLoader();

  _HistoryPage createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  Widget build(BuildContext context) {
    return Scaffold(body: widget._loader.load_history(widget.userSnapshot));
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
