import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thetamedbot/pages/signin_page/validators.dart';
import 'package:thetamedbot/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';
import '../description_page/description.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _emailKey =
      GlobalKey<FormFieldState>(debugLabel: 'email');
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text('Hello',
                          style: TextStyle(
                              fontSize: 80.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 185.0, 0.0, 0.0),
                      child: Text('There',
                          style: TextStyle(
                              fontSize: 80.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(240.0, 185.0, 0.0, 0.0),
                      child: Text('.',
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        key: _emailKey,
                        controller: _emailController,
                        validator: EmailFieldValidator.validate,
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: _passwordController,
                        validator: PasswordFieldValidator.validate,
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: true,
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          onTap: () async {
                            if (_emailKey.currentState.validate()) {
                              await _forgotPassword(context);
                            }
                          },
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            await _signInEP(context);
                          }
                        },
                        child: Container(
                          height: 40.0,
                          child: Material(
                            key: Key('signIn'),
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.blueAccent,
                            color: Colors.blue,
                            elevation: 7.0,
                            child: Center(
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New to ThetaMedBot?',
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context, '/sup');
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return DescriptionPage();
                      }));
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _signInEP(BuildContext context) async {
    try {
      final auth = context.read<FirebaseAuthService>();
      await auth.signInWithEmailAndPassword(
          _emailController.text, _passwordController.text);
    } on FirebaseAuthException catch (e) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("${e.message}"),
      ));
    }
  }

  _forgotPassword(BuildContext context) async {
    try {
      final auth = context.read<FirebaseAuthService>();
      await auth.sendPasswordResetEmail(_emailKey.currentState.value);
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
            "Password reset request sent to ${_emailKey.currentState.value}, Please check your email."),
      ));
    } on FirebaseAuthException catch (e) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("${e.message}"),
      ));
    }
  }
}
