import 'package:flutter/material.dart';

import 'package:uddhriti/helpers/common_widgets/facility_button.dart';

class EditButton extends StatefulWidget {
  EditButton(
      {@required this.initialQuotetext, @required this.onQuoteTextChanged});
  final String initialQuotetext;
  final Function(String) onQuoteTextChanged;

  @override
  _EditButtonState createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  TextEditingController _textController = TextEditingController();
  String quoteText;

  @override
  void initState() {
    super.initState();
    quoteText = widget.initialQuotetext;
  }

  _onEditButtonPressed(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12.0),
              ),
              height: 330.0,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 60.0,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            "CANCEL",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              quoteText = _textController.text;
                            });
                            widget.onQuoteTextChanged(quoteText);
                            print(quoteText);
                          },
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            "OK",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextField(
                          controller: _textController,
                          cursorColor: Colors.teal,
                          keyboardType: TextInputType.multiline,
                          maxLines: 10,
                          maxLength: 500,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10.0),
                            hintText: "Type some text...",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return facilityButton(
      icon: Icons.edit,
      label: "Edit",
      onPressed: () {
        print('edit button pressed');
        _onEditButtonPressed(context);
      },
    );
  }
}
