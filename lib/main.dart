import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thetamedbot/locals/newapptheme.dart';
import 'package:thetamedbot/pages/auth_widget.dart';
import 'package:thetamedbot/pages/auth_widget_builder.dart';
import 'package:thetamedbot/pages/home_page/home_page_v1.dart';
import 'package:thetamedbot/pages/description_page/description.dart';
import 'package:thetamedbot/pages/privacy_page/privacy_page.dart';
import 'package:thetamedbot/pages/profile_page/profile_page.dart';
import 'package:thetamedbot/pages/signin_page/signin_page.dart';
import 'package:thetamedbot/pages/signin_page/signup_page.dart';
import 'package:thetamedbot/pages/tc_page/tc_page.dart';
import 'package:thetamedbot/services/firebase_auth_service.dart';
import 'package:thetamedbot/services/loader_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(
          create: (_) => FirebaseAuthService(),
        ),
        ChangeNotifierProvider<LoaderService>(
          create: (_) => LoaderService(),
        ),
      ],
      child: AuthWidgetBuilder(builder: (context, userSnapshot) {
        return MaterialApp(
          title: 'ThetaMedBot',
          theme: NewAppTheme.lightThemeData,
          home: AuthWidget(
            userSnapshot: userSnapshot,
          ),
          routes: <String, WidgetBuilder>{
            "/home": (context) => HomePage(userSnapshot: userSnapshot),
            "/sin": (context) => SignInPage(),
            "/sup": (context) => SignUpPage(),
            "/profile": (context) => ProfilePage(userSnapshot: userSnapshot),
            "/privacy": (context) => PrivacyApps(),
            "/tc": (context) => TCPage(),
            "/dp": (context) => Description(),
          },
        );
      }),
    );
  }
}
