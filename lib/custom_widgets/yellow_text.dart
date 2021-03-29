import 'package:flutter/material.dart';

class YellowText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final double fontSize;
  final FontWeight fontWeight;

  const YellowText(
      {Key key, this.text, this.style, this.fontSize, this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: fontSize == null ? 14.0 : fontSize,
          fontWeight: fontWeight == null ? FontWeight.normal : fontWeight),
    );
  }
}
