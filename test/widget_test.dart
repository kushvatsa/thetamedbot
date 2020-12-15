/*import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:thetamedbot/interfaces/firebase_auth_interface.dart';
import 'package:thetamedbot/models/myuser.dart';
import 'package:thetamedbot/pages/signin_page/signin_page.dart';
import 'package:provider/provider.dart';
import 'package:thetamedbot/pages/signin_page/signup_page.dart';

class MockAuth extends Mock implements AuthService {}

void main() {
  Widget buildTestableWidget(Widget widget) {
    return new MediaQuery(
        data: new MediaQueryData(), child: new MaterialApp(home: widget));
  }

  testWidgets('testing widget', (WidgetTester tester) async {
    // create a LoginPage
    SignInPage signInPage = SignInPage();
    // add it to the widget tester
    await tester.pumpWidget(buildTestableWidget(signInPage));

    // tap on the login button
    Finder loginButton = find.byKey(new Key('signIn'));
    await tester.tap(loginButton);
  });
  Widget makeTestableWidget({Widget child, AuthService auth}) {
    return Provider<AuthService>(
      create: (_) => auth,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets('email or password is empty, does not sign in',
      (WidgetTester tester) async {
    MockAuth mockAuth = MockAuth();

    SignInPage page = SignInPage();

    await tester.pumpWidget(makeTestableWidget(child: page, auth: mockAuth));

    await tester.tap(find.byKey(Key('signIn')));

    verifyNever(mockAuth.signInWithEmailAndPassword('', ''));
  });

  testWidgets(
      'non-empty email and password, valid account, call sign up, succeed',
      (WidgetTester tester) async {
    MockAuth mockAuth = MockAuth();
    when(mockAuth.signInWithEmailAndPassword('email', 'password'))
        .thenAnswer((invocation) => Future.value(MyUser(uid: "uid")));

    SignUpPage page = SignUpPage();

    await tester.pumpWidget(makeTestableWidget(child: page, auth: mockAuth));

    Finder emailField = find.byKey(Key('email'));
    await tester.enterText(emailField, 'email');

    Finder passwordField = find.byKey(Key('password'));
    await tester.enterText(passwordField, 'password');

    await tester.tap(find.byKey(Key('signUp')));

    verifyNever(mockAuth.createUserWithEmailAndPassword(
            'kushvatsa007@gmail.com', '1234567'))
        .called(0);
  });

  testWidgets(
      'non-empty email and password, valid account, call sign up, fails',
      (WidgetTester tester) async {
    MockAuth mockAuth = MockAuth();
    when(mockAuth.signInWithEmailAndPassword('email', 'password'))
        .thenThrow(StateError('invalid credentials'));

    SignUpPage page = SignUpPage();

    await tester.pumpWidget(makeTestableWidget(child: page, auth: mockAuth));

    Finder emailField = find.byKey(Key('email'));
    await tester.enterText(emailField, 'email');

    Finder passwordField = find.byKey(Key('password'));
    await tester.enterText(passwordField, 'password');

    await tester.tap(find.byKey(Key('signUp')));

    verifyNever(mockAuth.createUserWithEmailAndPassword('email', 'password'))
        .called(0);
  });
}
*/
