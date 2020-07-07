import 'package:flutter/material.dart';
import 'package:uddhriti/helpers/common_widgets/facility_button.dart';

class ChangeTextSize extends StatefulWidget {
  ChangeTextSize(
      {@required this.initialBoolValue, @required this.showTextSizeSlider});
  final bool initialBoolValue;
  final Function(bool) showTextSizeSlider;
  @override
  _ChangeTextSizeState createState() => _ChangeTextSizeState();
}

class _ChangeTextSizeState extends State<ChangeTextSize> {
  bool showTextSizeSlider;

  @override
  void initState() {
    super.initState();
    showTextSizeSlider = widget.initialBoolValue;
  }

  @override
  Widget build(BuildContext context) {
    return facilityButton(
      icon: Icons.format_size,
      label: "Size",
      onPressed: () {
        setState(() {
          showTextSizeSlider = true;
          widget.showTextSizeSlider(showTextSizeSlider);
        });
      },
    );
  }
}
