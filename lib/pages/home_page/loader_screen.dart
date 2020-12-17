import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class ScreenLoader extends StatefulWidget {
  @override
  _ScreenLoaderState createState() => _ScreenLoaderState();
}

class _ScreenLoaderState extends State<ScreenLoader> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 10);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(body: initScreen(context));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.black,
              strokeWidth: 2,
            ),
            SizedBox(height: 10),
            Center(
                child: Text("Processing The Image",
                    style: GoogleFonts.abel(fontSize: 15,
                        color: Colors.black, fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}