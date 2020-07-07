import 'package:flutter/material.dart';
import 'package:uddhriti/pages/authenticate/sign_in_screen.dart';
import 'package:uddhriti/pages/authenticate/sign_up_screen.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}
// email - droy111333444@gmail.com
// pass - thisis123

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn ? SignInPage(toggleView: toggleView) : SignUpPage(toggleView: toggleView);
  }
}