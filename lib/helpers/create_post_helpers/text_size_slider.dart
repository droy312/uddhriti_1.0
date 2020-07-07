import 'package:flutter/material.dart';

class TextSizeSlider extends StatefulWidget {
  TextSizeSlider(
      {@required this.defaultFontSize,
      @required this.onPressed,
      @required this.onTextSizeChanged});
  final double defaultFontSize;
  final VoidCallback onPressed;
  final Function(int) onTextSizeChanged;
  @override
  _TextSizeSliderState createState() => _TextSizeSliderState();
}

class _TextSizeSliderState extends State<TextSizeSlider> {
  double maxFontSize = 60.0;
  double minFontSize = 5.0;
  int quoteFontSize;

  @override
  void initState() {
    super.initState();
    quoteFontSize = widget.defaultFontSize.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                quoteFontSize.toString(),
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.pink,
                  inactiveTrackColor: Colors.grey[600],
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                ),
                child: Slider(
                  value: quoteFontSize.toDouble(),
                  min: minFontSize,
                  max: maxFontSize,
                  onChanged: (double newValue) {
                    setState(() {
                      quoteFontSize = newValue.round();
                      widget.onTextSizeChanged(quoteFontSize);
                    });
                  },
                ),
              ),
            ],
          ),
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
