import 'package:flutter/material.dart';

Widget textViewComponent({
  required String text,
  required FontWeight fontWeight,
  required Color textColor,
  required double fontSize,
  TextAlign align = TextAlign.start,
}) {
  return Text(text,
      textAlign: align,
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ));
}

Widget textViewWrapped({
  required String text,
  required FontWeight fontWeight,
  required Color textColor,
  required double fontSize,
  required int maxLines,
  TextAlign alignment = TextAlign.start,
}) {
  return Text(text,
      textAlign: alignment,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textWidthBasis: TextWidthBasis.longestLine,
      style: TextStyle(
          color: textColor, fontWeight: fontWeight, fontSize: fontSize));
}
