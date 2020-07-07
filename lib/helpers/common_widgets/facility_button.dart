import 'package:flutter/material.dart';

Widget facilityButton({
    @required IconData icon,
    @required String label,
    @required Function onPressed,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 30.0, top: 10.0, bottom: 10.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.grey[900],
                size: 25.0,
              ),
              SizedBox(height: 8.0),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }