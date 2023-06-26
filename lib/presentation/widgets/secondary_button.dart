import 'package:flutter/material.dart';
import '../../base/utils/colors.dart';
import 'text_view.dart';

Widget secondaryButton(
  String title,
  Function onPressed, {
  bool isSecondary = false,
}) {
  return ElevatedButton(
    onPressed: () {
      onPressed();
    },
    style: OutlinedButton.styleFrom(
      side: BorderSide(
          width: 1.0,
          color: !isSecondary ? AppColors.primary : AppColors.secondary),
      backgroundColor: Colors.white,
      minimumSize: const Size(100, 42),
    ),
    child: textViewComponent(
      text: title,
      fontWeight: FontWeight.bold,
      textColor: !isSecondary ? AppColors.primary : AppColors.secondary,
      fontSize: 14,
    ),
  );
}

Widget alterSecondaryButton(String title, Function onPressed) {
  return ElevatedButton(
    onPressed: () {
      onPressed();
    },
    style: OutlinedButton.styleFrom(
      side: const BorderSide(width: 1.0, color: AppColors.secondary),
      backgroundColor: Colors.white,
      minimumSize: const Size(100, 42),
    ),
    child: textViewComponent(
      text: title,
      fontWeight: FontWeight.bold,
      textColor: AppColors.secondary,
      fontSize: 14,
    ),
  );
}
