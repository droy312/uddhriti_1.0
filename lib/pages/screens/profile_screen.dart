import 'package:flutter/material.dart';
import 'package:uddhriti/models/user.dart';
import 'package:uddhriti/services/auth.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthService _auth = AuthService();

  Widget _signOutBtn() {
    return RaisedButton(
      onPressed: () async {
        await _auth.signOut();
      },
      child: Center(child: Text('Sign out')),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          child: _signOutBtn(),
        ),
      ),
    );
  }
}