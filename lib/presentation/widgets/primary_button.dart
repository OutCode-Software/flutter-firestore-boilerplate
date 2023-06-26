import 'package:flutter/material.dart';
import '../../base/utils/colors.dart';
import 'text_view.dart';

Widget primaryButton(String title, Function onPressed,
    {bool isSecondary = false}) {
  return ElevatedButton(
    onPressed: () {
      onPressed();
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
          !isSecondary ? AppColors.primary : AppColors.secondary),
      minimumSize: MaterialStateProperty.all(const Size(100, 42)),
    ),
    child: textViewComponent(
      text: title,
      fontWeight: FontWeight.bold,
      textColor: Colors.white,
      fontSize: 14,
    ),
  );
}

Widget alterPrimaryButton(String title, Function onPressed) {
  return ElevatedButton(
    onPressed: () {
      onPressed();
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.secondary),
      minimumSize: MaterialStateProperty.all(const Size(100, 42)),
    ),
    child: textViewComponent(
      text: title,
      fontWeight: FontWeight.bold,
      textColor: Colors.white,
      fontSize: 14,
    ),
  );
}
