import 'package:flutter/material.dart';

class RedText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final double fontSize;
  final FontWeight fontWeight;

  const RedText(
      {Key key, this.text, this.style, this.fontSize, this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.red,
          fontSize: fontSize == null ? 14.0 : fontSize,
          fontWeight: fontWeight == null ? FontWeight.normal : fontWeight),
    );
  }
}
