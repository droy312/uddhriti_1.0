import 'package:flutter/material.dart';
import 'package:uddhriti/constants.dart';

FocusNode _usernameFocusNode = FocusNode();
FocusNode _emailFocusNode = FocusNode();
FocusNode _passwordFocusNode = FocusNode();

void fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

Widget nameInput({BuildContext context, Function validator, Function onSaved}) {
  return TextFormField(
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
    focusNode: _usernameFocusNode,
    onFieldSubmitted: (_) {
      fieldFocusChange(context, _usernameFocusNode, _emailFocusNode);
    },
    validator: validator,
    onSaved: onSaved,
  );
}

Widget emailInput(
    {BuildContext context, Function validator, Function onSaved}) {
  return TextFormField(
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
    focusNode: _emailFocusNode,
    onFieldSubmitted: (_) {
      fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
    },
    validator: validator,
    onSaved: onSaved,
  );
}

Widget passwordInput(
    {BuildContext context, Function validator, Function onSaved}) {
  return TextFormField(
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.done,
    obscureText: true,
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
        suffixIcon: Icon(
          Icons.remove_red_eye,
          color: Colors.grey[700],
        )),
    focusNode: _passwordFocusNode,
    validator: validator,
    onSaved: onSaved,
  );
}
