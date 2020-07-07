import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  CircularButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.grey[300],
      child: Icon(
        icon,
        color: Colors.black87,
        size: 22.0,
      ),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(width: 40.0, height: 40.0),
      shape: CircleBorder(),
      onPressed: onPressed,
    );
  }
}
