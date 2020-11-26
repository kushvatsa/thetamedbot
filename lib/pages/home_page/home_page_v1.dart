import 'package:flutter/material.dart';
import 'package:thetamedbot/models/myuser.dart';
import 'package:fancy_bottom_bar/fancy_bottom_bar.dart';
import 'package:thetamedbot/pages/profile_page/profile_page.dart';
import 'bottom_app_bar_pages/description_skin_cancer.dart';
import 'bottom_app_bar_pages/history_page.dart';

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
    var pages = [
      SkinCancerDescription(userSnapshot: widget.userSnapshot),
      /*Container()*/ HistoryPage(userSnapshot: widget.userSnapshot),
      ProfilePage(userSnapshot: widget.userSnapshot)
    ];

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
      bottomNavigationBar: FancyBottomBar(
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
