import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thetamedbot/models/myuser.dart';
import 'package:google_fonts/google_fonts.dart';
import '../drag_drop/malaria_prediction.dart';
import 'package:fancy_bottom_bar/fancy_bottom_bar.dart';
import 'bottom_app_bar_pages/profile_page.dart';
import 'bottom_app_bar_pages/description_page.dart';
import 'bottom_app_bar_pages/description_skin_cancer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, @required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<MyUser> userSnapshot;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPos = 0;
  
  @override
  Widget build(BuildContext context) {
    //int selectedPos = 0;
    var pages = [SkinCancerDescription(), Container(),AccPage(userSnapshot: widget.userSnapshot)];

    final tabItems = [
      FancyBottomItem(title: Text("Diagnose"), icon: Icon(Icons.search)),
      FancyBottomItem(title: Text("History"), icon: Icon(Icons.list)),
      FancyBottomItem(title: Text("Profile"), icon: Icon(Icons.person)),
    ];

    

    void _handleIndexChanged(int i) {
      setState(() {
        
        selectedPos = i;
      });
    }

    return Scaffold(
      bottomNavigationBar:
         
          FancyBottomBar(
        onItemSelected: (i) => setState(() {
          selectedPos = i;
          print(selectedPos);
          print(tabItems[selectedPos]);
        }),
        items: tabItems,
        selectedPosition: selectedPos,
        selectedColor: Colors.amber,
        indicatorColor: Colors.deepPurple,
      ),
      body: pages[selectedPos],
    );
  }
}
