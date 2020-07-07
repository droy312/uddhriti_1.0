import 'package:flutter/material.dart';
import 'package:uddhriti/helpers/common_widgets/facility_button.dart';

class ChangeTextStyle extends StatefulWidget {
  ChangeTextStyle(
      {@required this.initialBoolValue, @required this.showTextStylePanel});
  final bool initialBoolValue;
  final Function(bool) showTextStylePanel;

  @override
  _ChangeTextStyleState createState() => _ChangeTextStyleState();
}

class _ChangeTextStyleState extends State<ChangeTextStyle> {
  bool showTextStylePanel;

  @override
  void initState() {
    super.initState();
    showTextStylePanel = widget.initialBoolValue;
  }

  @override
  Widget build(BuildContext context) {
    return facilityButton(
      icon: Icons.format_bold,
      label: "Style",
      onPressed: () {
        setState(() {
          showTextStylePanel = true;
          widget.showTextStylePanel(showTextStylePanel);
        });
      },
    );
  }
}
