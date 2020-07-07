import 'package:flutter/material.dart';
import 'package:uddhriti/helpers/common_widgets/circular_button.dart';

class TextStylePanel extends StatefulWidget {
  TextStylePanel(
      {@required this.initialBoolBoldText,
      @required this.initialBoolItalicText,
      @required this.initialBoolUnderlinedText,
      @required this.boldText,
      @required this.italicText,
      @required this.underlinedText,
      @required this.onStyleCancel,
      @required this.onPressed});
  final bool initialBoolBoldText,
      initialBoolItalicText,
      initialBoolUnderlinedText;
  final VoidCallback onPressed;
  final VoidCallback onStyleCancel;
  final Function(bool) boldText;
  final Function(bool) italicText;
  final Function(bool) underlinedText;

  @override
  _TextStylePanelState createState() => _TextStylePanelState();
}

class _TextStylePanelState extends State<TextStylePanel> {
  bool boolBoldText, boolItalicText, boolUnderlinedText;

  @override
  void initState() {
    super.initState();
    boolBoldText = widget.initialBoolBoldText;
    boolItalicText = widget.initialBoolItalicText;
    boolUnderlinedText = widget.initialBoolUnderlinedText;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CircularButton(
          icon: Icons.format_bold,
          onPressed: () {
            setState(() {
              boolBoldText = true;
              widget.boldText(boolBoldText);
            });
          },
        ),
        CircularButton(
          icon: Icons.format_italic,
          onPressed: () {
            setState(() {
              boolItalicText = true;
              widget.italicText(boolItalicText);
            });
          },
        ),
        CircularButton(
          icon: Icons.format_underlined,
          onPressed: () {
            setState(() {
              boolUnderlinedText = true;
              widget.underlinedText(boolUnderlinedText);
            });
          },
        ),
        CircularButton(
          icon: Icons.format_clear,
          onPressed: widget.onStyleCancel,
        ),
        FlatButton(
          onPressed: widget.onPressed,
          color: Theme.of(context).primaryColor,
          child: Text(
            "DONE",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
