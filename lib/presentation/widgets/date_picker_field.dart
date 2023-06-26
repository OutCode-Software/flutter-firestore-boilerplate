import 'package:flutter/material.dart';

import '../../base/utils/app_spacing.dart';
import '../../base/utils/colors.dart';
import 'text_view.dart';

Widget datePickerField(
  Function onTap, {
  required String placeholder,
  required String hint,
  String? errorMessage,
  required TextEditingController controller,
  required bool doValidate,
  bool isReportPicker = false,
  bool isSecondary = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textViewComponent(
        text: placeholder,
        fontWeight: FontWeight.normal,
        textColor: isReportPicker
            ? !isSecondary
                ? AppColors.primary
                : AppColors.secondary
            : AppColors.primaryElementColor,
        fontSize: 17,
      ),
      AppSpacing.verticalSpacing8,
      TextFormField(
        readOnly: true,
        onTap: () {
          onTap();
        },
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
            hintText: hint,
            fillColor: AppColors.fieldBorderColor,
            filled: true,
            suffixIcon: const Icon(Icons.calendar_month),
            suffixIconColor:
                isSecondary ? AppColors.secondary : AppColors.primary,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8)))),
        validator: (value) {
          if (doValidate) {
            if (value == null || value.isEmpty) {
              return errorMessage ?? '';
            }
            return null;
          } else {
            return null;
          }
        },
        controller: controller,
      ),
    ],
  );
}
