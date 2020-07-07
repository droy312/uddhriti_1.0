import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:uddhriti/helpers/common_widgets/facility_button.dart';

class ChangeBackgroundColor extends StatefulWidget {
  ChangeBackgroundColor(
      {@required this.initialBackgroundColor,
      @required this.onBackgroundColorChanged});

  final Color initialBackgroundColor;
  final Function(Color) onBackgroundColorChanged;

  @override
  _ChangeBackgroundColorState createState() => _ChangeBackgroundColorState();
}

class _ChangeBackgroundColorState extends State<ChangeBackgroundColor> {
  Color currentBGColor;

  @override
  void initState() {
    super.initState();
    currentBGColor = widget.initialBackgroundColor;
  }

  void changeBGColor(Color color) {
    setState(() {
      currentBGColor = color;
    });
    widget.onBackgroundColorChanged(currentBGColor);
  }

  _changeBGColor(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            titlePadding: EdgeInsets.all(0.0),
            contentPadding: EdgeInsets.zero,
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: currentBGColor,
                onColorChanged: changeBGColor,
                colorPickerWidth: 300.0,
                pickerAreaHeightPercent: 0.7,
                enableAlpha: false,
                displayThumbColor: true,
                showLabel: true,
                paletteType: PaletteType.hsv,
                pickerAreaBorderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2.0),
                  topRight: Radius.circular(2.0),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return facilityButton(
      icon: Icons.format_color_fill,
      label: "BG Color",
      onPressed: () {
        _changeBGColor(context);
      },
    );
  }
}
