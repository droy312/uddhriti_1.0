import 'package:flutter/material.dart';
import 'package:uddhriti/services/auth.dart';

class GoogleSignInPage extends StatefulWidget {
  GoogleSignInPage({Key key}) : super(key: key);

  @override
  _GoogleSignInPageState createState() => _GoogleSignInPageState();
}

class _GoogleSignInPageState extends State<GoogleSignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () => AuthService().signInWithGoogle(),
          child: Text('Google Sign In'),
        ),
      ),
    );
  }
}
