import 'package:flutter/material.dart';
import 'package:uddhriti/constants.dart';
import 'package:uddhriti/pages/home.dart';
import 'package:uddhriti/pages/authenticate/sign_in_screen.dart';
import 'package:uddhriti/services/auth.dart';
import 'package:uddhriti/widgets/textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants.dart';

class SignUpPage extends StatefulWidget {
  final Function toggleView;
  SignUpPage({this.toggleView});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;

  // text field state
  String username = '';
  String email = '';
  String password = '';

  String error = '';

  bool loading = false;

  final spinkit = Container(
    color: Colors.white,
    child: Center(
        child: SpinKitThreeBounce(
      color: kPrimaryColor,
      size: 50.0,
    )),
  );

  // an instance of the AuthService class
  final AuthService _auth = AuthService();

  // code from textfield.dart
  Widget nameInput() {
    return TextFormField(
      onChanged: (val) {
        setState(() {
          username = val;
        });
      },
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.grey[700],
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 18.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        hintText: "e.g. Morgan",
        hintStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.grey[600],
        ),
        labelText: "Username",
        labelStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.grey[700],
          fontWeight: FontWeight.w600,
        ),
      ),
      validator: (name) {
        Pattern pattern = r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(name))
          return 'Invalid username';
        else
          return null;
      },
      // focusNode: _usernameFocusNode,
      // onFieldSubmitted: (_) {
      //   fieldFocusChange(context, _usernameFocusNode, _emailFocusNode);
      // },
      // validator: validator,
      // onSaved: onSaved,
    );
  }

  Widget emailInput() {
    return TextFormField(
      onChanged: (val) {
        setState(() {
          email = val;
        });
      },
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.grey[700],
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 18.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        hintText: "e.g. morgan@gmail.com",
        hintStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.grey[600],
        ),
        labelText: "E-mail ID",
        labelStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.grey[700],
          fontWeight: FontWeight.w600,
        ),
      ),
      //validator: (val) => val.isEmpty ? 'Enter an email' : null,
      validator: (email) =>
          EmailValidator.validate(email) ? null : "Invalid email address",
      // focusNode: _emailFocusNode,
      // onFieldSubmitted: (_) {
      //   fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
      // },
      // validator: validator,
      // onSaved: onSaved,
    );
  }

  Widget passwordInput() {
    return TextFormField(
      onChanged: (val) {
        setState(() {
          password = val;
        });
      },
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      obscureText: _isObscure,
      cursorColor: Colors.grey[700],
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 18.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        hintText: "Enter your password",
        hintStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.grey[600],
        ),
        labelText: "Password",
        labelStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.grey[700],
          fontWeight: FontWeight.w600,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          icon: Icon(
            Icons.remove_red_eye,
            color: Colors.grey[700],
          ),
        ),
      ),
      validator: (password) {
        Pattern pattern = r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(password))
          return 'Must contain 6 characters including one letter and one number';
        else
          return null;
      },
      // focusNode: _passwordFocusNode,
      // validator: validator,
      // onSaved: onSaved,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return loading
        ? spinkit
        : Scaffold(
            backgroundColor: Colors.grey[50],
            body: Container(
              height: size.height,
              width: size.width,
              color: kBackgroundColor,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  left: 20.0,
                  right: 20.0,
                  bottom: 0.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 180.0,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Create Account,",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Text(
                            "Sign up to get started!",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height -
                          260.0 -
                          MediaQuery.of(context).padding.top,
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          physics:
                              ScrollPhysics(parent: BouncingScrollPhysics()),
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 0.0),
                          children: <Widget>[
                            //nameInput(),
                            SizedBox(height: 12.0),
                            emailInput(),
                            SizedBox(height: 8.0),
                            passwordInput(),
                            SizedBox(height: 25.0),
                            GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });

                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(() {
                                      error = 'please supply a valid email';
                                      print('Error: ' + error);

                                      loading = false;
                                    });
                                  }
                                  // else {
                                  //   _formKey.currentState.save();
                                  //   Navigator.of(context).push(MaterialPageRoute(
                                  //       builder: (context) => HomeScreen()));
                                  // }
                                }
                              },
                              child: Container(
                                height: 55.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: kPrimaryColor,
                                ),
                                child: Center(
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Container(
                              height: 55.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.grey[300]),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: 28.0,
                                      width: 28.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)),
                                        color: Color(0xFF000090),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "f",
                                          style: TextStyle(
                                              color: Colors.grey[300],
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      "Connect with Facebook",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF000090),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.center,
                              child: Text(
                                error,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 80.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "I'm already a member,",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 8.0),
                          GestureDetector(
                            onTap: () {
                              // Navigator.of(context).pushReplacement(MaterialPageRoute(
                              //     builder: (context) => SignInPage()));
                              widget.toggleView();
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
