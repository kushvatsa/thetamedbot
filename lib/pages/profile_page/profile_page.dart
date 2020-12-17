import 'package:flutter/material.dart';
import 'package:thetamedbot/models/myuser.dart';
import 'package:thetamedbot/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  final AsyncSnapshot<MyUser> userSnapshot;

  const ProfilePage({Key key, @required this.userSnapshot}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      final wX = constraints.maxWidth;
      return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(
            'Profile',
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
            padding:
                EdgeInsets.fromLTRB(changePadX(wX), 16.0, changePadX(wX), 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.account_circle,
                          size: 200.0, color: Colors.grey[700]),
                      if (widget.userSnapshot.data.displayName != null)
                        SizedBox(height: 15.0),
                      if (widget.userSnapshot.data.displayName != null)
                        Center(
                          child: Text(widget.userSnapshot.data.displayName,
                              style: TextStyle(fontSize: 17.0)),
                        ),
                      Divider(height: 20.0),
                      FilterChip(
                        label: Center(
                          child: Text(widget.userSnapshot.data.email,
                              style: TextStyle(fontSize: 17.0)),
                        ),
                        avatar: widget.userSnapshot.data.emailVerified
                            ? Icon(Icons.check, color: Colors.green)
                            : Icon(Icons.close, color: Colors.red),
                        onSelected: (bool) async {
                          if (!widget.userSnapshot.data.emailVerified) {
                            final auth = context.read<FirebaseAuthService>();
                            await auth.verifyEmailSend();
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text(
                                  "Email verification sent, Please check your email."),
                            ));
                          }
                        },
                      )
                    ],
                  ),
                ),
                Divider(height: 20.0),
                GestureDetector(
                  onTap: () async {
                    Navigator.pushNamed(context, "/privacy");
                  },
                  child: Card(
                    child: ListTile(
                      title: Center(
                        child: Text(
                          "Privacy",
                          style: theme.textTheme.subtitle1,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pushNamed(context, "/tc");
                  },
                  child: Card(
                    child: ListTile(
                      title: Center(
                        child: Text(
                          "Terms and Conditions",
                          style: theme.textTheme.subtitle1,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final auth = context.read<FirebaseAuthService>();
                    await auth.signOut();
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return SignInPage();
                    // }));
                  },
                  child: Card(
                    child: ListTile(
                      title: Center(
                        child: Text(
                          'Logout',
                          style: theme.textTheme.subtitle1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      );
    });
  }

  double changePadX(double width) {
    if (width > 900) {
      return 128;
    } else if (width < 900 && width > 600) {
      return 64;
    } else {
      return 16;
    }
  }
}
