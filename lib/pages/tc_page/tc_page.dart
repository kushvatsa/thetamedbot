/*import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:thetamedbot/locals/translations.dart';
import 'package:url_launcher/url_launcher.dart';

class TCPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final trans = Translations();
    final theme = Theme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      final wX = constraints.maxWidth;
      return Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text(
              trans.text("tc"),
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
                    Text(trans.text("tcMain"),
                        style: theme.textTheme.headline3),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("1. ${trans.text("tch1")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 16.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(
                            text:
                                "${trans.text("tch1c1x")} “${trans.text("th")}” "),
                        TextSpan(text: " ${trans.text("tch1c1")} "),
                        TextSpan(text: " ${trans.text("tch1c2")} "),
                        TextSpan(
                          text: "${trans.text("privacyPolicy")}, ",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              return Navigator.pushNamed(context, "/privacy");
                            },
                        ),
                        TextSpan(text: trans.text("tch1c3")),
                      ]),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(text: "${trans.text("tch1c4")} "),
                        if (kIsWeb) TextSpan(text: " ${trans.text("tch1c4x")}"),
                        TextSpan(text: " ${trans.text("tch1c5")}"),
                      ]),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("2. ${trans.text("tch2")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(text: trans.text("tch2c1")),
                        TextSpan(
                          text: " ${trans.text("privacyPolicy")}, ",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              return Navigator.pushNamed(context, "/privacy");
                            },
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(text: trans.text("tch2c2")),
                        TextSpan(
                          text: " ${trans.text("contactUs").toLowerCase()}.",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              _openEmailBox(
                                  trans: trans, subject: "accountHelp");
                            },
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("3. ${trans.text("tch3")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("${trans.text("tch3c1")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch3c2")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("4. ${trans.text("tch4")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("${trans.text("tch4c1")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("• ${trans.text("tch4c1p1")}",
                        style: theme.textTheme.subtitle2),
                    Text("• ${trans.text("tch4c1p2")}",
                        style: theme.textTheme.subtitle2),
                    Text("• ${trans.text("tch4c1p3")}",
                        style: theme.textTheme.subtitle2),
                    Text("• ${trans.text("tch4c1p4")}",
                        style: theme.textTheme.subtitle2),
                    Text("• ${trans.text("tch4c1p5")}",
                        style: theme.textTheme.subtitle2),
                    Text("• ${trans.text("tch4c1p6")}",
                        style: theme.textTheme.subtitle2),
                    Text("• ${trans.text("tch4c1p7")}",
                        style: theme.textTheme.subtitle2),
                    Text("• ${trans.text("tch4c1p8")}",
                        style: theme.textTheme.subtitle2),
                    Text("• ${trans.text("tch4c1p9")}",
                        style: theme.textTheme.subtitle2),
                    Text("• ${trans.text("tch4c1p10")}",
                        style: theme.textTheme.subtitle2),
                    Text("• ${trans.text("tch4c1p11")}",
                        style: theme.textTheme.subtitle2),
                    Text("• ${trans.text("tch4c1p12")}",
                        style: theme.textTheme.subtitle2),
                    Text("• ${trans.text("tch4c1p13")}",
                        style: theme.textTheme.subtitle2),
                    Text("• ${trans.text("tch4c1p14")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch4c2")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch4c3")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 8.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.headline5, children: [
                        TextSpan(text: "${trans.text("tch5")}"),
                        TextSpan(text: " ${trans.text("th")}."),
                      ]),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("${trans.text("tch5c1")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch5c2")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch5c3")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch5c4")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch5c5")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch5c6")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 8.0,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("6. ${trans.text("tch6")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(
                            text: "${trans.text("generally")}. ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: "${trans.text("tch6c1")}"),
                      ]),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch6c2")}",
                        style: theme.textTheme.subtitle1),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch6c3")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(text: "${trans.text("tch6c4")} "),
                        TextSpan(
                          text:
                              " ${trans.text("customerSupport").toLowerCase()}. ",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              _openEmailBox(trans: trans, subject: "payHelp");
                            },
                        ),
                        TextSpan(text: "${trans.text("tch6c5")}"),
                      ]),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch6c6")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch6c7")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(
                            text: "${trans.text("tch6c8")} ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: "${trans.text("tch6c9")}"),
                      ]),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch6c10")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(
                            text: "${trans.text("refunds")} ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: "${trans.text("tch6c11")}"),
                      ]),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch6c12")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch6c14")}:",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text("${trans.text("tch6c15")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(text: "${trans.text("tch6c16")} "),
                        TextSpan(
                          text:
                              " ${trans.text("customerSupport").toLowerCase()} ",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              _openEmailBox(trans: trans, subject: "payHelp");
                            },
                        ),
                        TextSpan(text: "${trans.text("tch6c17")}"),
                      ]),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch6c18")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch6c19")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(
                            text: "${trans.text("pricing")}. ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: "${trans.text("tch6c20")}"),
                      ]),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("7. ${trans.text("tch7")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("${trans.text("tch7c1")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("${trans.text("tch7c2")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("8. ${trans.text("tch8")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("${trans.text("tch8c1")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("9. ${trans.text("tch9")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("${trans.text("tch9c1")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("10. ${trans.text("tch10")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(text: "${trans.text("tch10c1")} "),
                        TextSpan(
                          text:
                              "${trans.text("customerSupport").toLowerCase()}.",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await _openEmailBox(
                                  trans: trans, subject: "arbitrationLaw");
                            },
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("11. ${trans.text("tch11")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("${trans.text("tch11c1")}",
                        style: theme.textTheme.subtitle2),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("12. ${trans.text("tch12")}",
                        style: theme.textTheme.headline5),
                    SizedBox(
                      height: 8.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.subtitle2, children: [
                        TextSpan(text: "${trans.text("tch12c1")} "),
                        TextSpan(
                          text: "${trans.text("privacy").toLowerCase()}. ",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              return Navigator.pushNamed(context, "/privacy");
                            },
                        ),
                        TextSpan(text: "${trans.text("tch12c2")} "),
                      ]),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    RichText(
                      text:
                          TextSpan(style: theme.textTheme.overline, children: [
                        TextSpan(text: "${trans.text("tcNote1")}"),
                        TextSpan(text: " “${trans.text("th")}”"),
                        TextSpan(text: "${trans.text("tcNote2")}"),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          )));
    });
  }

  _openEmailBox(
      {@required Translations trans, @required String subject}) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'kushvatsa007@gmail.com',
      query:
          'subject=${trans.text(subject).toUpperCase()}&body=[${trans.text("th").toUpperCase()}] ${trans.text("dnd").toUpperCase()} ', //add subject and body here
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
}*/
