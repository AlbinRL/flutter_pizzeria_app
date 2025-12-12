import 'package:flutter/material.dart';

class PizzeriaStyle {
  static const TextStyle baseTextStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    color: Colors.black87,
  );

  static final TextStyle title =
  baseTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold);

  static final TextStyle subtitle =
  baseTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600);

  static final TextStyle small = baseTextStyle.copyWith(fontSize: 12);
}
