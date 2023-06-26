import 'package:flutter/material.dart';

import '../../base/utils/colors.dart';
import 'text_view.dart';

Widget skipButton(Function onPressed) {
  return TextButton(
    onPressed: () {
      onPressed();
    },
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.white,
      minimumSize: const Size(100, 42),
    ),
    child: textViewComponent(
      text: 'Skip',
      fontWeight: FontWeight.bold,
      textColor: AppColors.primary,
      fontSize: 14,
    ),
  );
}
