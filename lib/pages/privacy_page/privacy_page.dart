import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:thetamedbot/locals/translations.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyApps extends StatelessWidget {
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final trans = Translations();
    return LayoutBuilder(builder: (context, constraints) {
      final wX = constraints.maxWidth;
      return Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text(
              trans.text("privacy"),
              style: theme.textTheme.subtitle1,
            ),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.close,
                ),
                onPressed: () {
                  return Navigator.of(context).pop();
                },
              ),
            ],
          ),
          body: SafeArea(
              child: Scrollbar(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    changePadX(wX), 16.0, changePadX(wX), 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(trans.text("prMain"),
                        style: theme.textTheme.headline4),
                    SizedBox(
                      height: 8.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(text: "${trans.text("at")}"),
                        TextSpan(text: " ${trans.text("th")},"),
                        TextSpan(text: " ${trans.text("prm1")}"),
                      ]),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(trans.text("prm2"), style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text("${trans.text("privacyPolicy")}",
                        style: theme.textTheme.headline4),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("1. ${trans.text("prh1")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(text: "${trans.text("prh1c1")}"),
                        TextSpan(text: " ${trans.text("th")}."),
                        TextSpan(text: " ${trans.text("prh1c2")}"),
                      ]),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("2. ${trans.text("prh2")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(trans.text("prh2c1"),
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("3. ${trans.text("prh3")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(trans.text("prh3c1"),
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("4. ${trans.text("prh4")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(trans.text("prh4c1"),
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("5. ${trans.text("prh5")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(trans.text("prh5c1"),
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(trans.text("prh5c2"),
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(trans.text("prh5c3"),
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("6. ${trans.text("prh6")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(trans.text("prh6c1"),
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(trans.text("prh6c2"),
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("7. ${trans.text("prh7")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(trans.text("prh7c1"),
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("8. ${trans.text("prh8")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(
                            text: "${trans.text("delete")}. ",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(text: "${trans.text("prh8c1")}"),
                      ]),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(
                            text: "${trans.text("uninstall")}. ",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(text: "${trans.text("prh8c2")}"),
                      ]),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("9. ${trans.text("prh9")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("9. ${trans.text("prh9c1")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("10. ${trans.text("prh10")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(text: "${trans.text("prh10c1")}"),
                        TextSpan(
                          text:
                              " ${trans.text("customerSupport").toLowerCase()} ",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              final Uri params = Uri(
                                scheme: 'mailto',
                                path: 'kushvatsa007@gmail.com',
                                query:
                                    'body=[${trans.text('th').toUpperCase()}] ${trans.text("dnd").toUpperCase()} ', //add subject and body here
                              );

                              var url = params.toString();
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          )));
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
