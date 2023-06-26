import 'package:flutter/material.dart';
import '../../base/utils/app_spacing.dart';
import '../../base/utils/colors.dart';

import 'text_view.dart';

Widget dropDownField(Function onTap,
    {required String placeholder,
    required String hint,
    String? errorMessage,
    required TextEditingController controller,
    required bool doValidate,
    bool isPlaceHolderVisible = true}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Visibility(
        visible: isPlaceHolderVisible,
        child: Column(
          children: [
            textViewComponent(
              text: placeholder,
              fontWeight: FontWeight.normal,
              textColor: AppColors.primaryElementColor,
              fontSize: 17,
            ),
            AppSpacing.verticalSpacing8,
          ],
        ),
      ),
      TextFormField(
        readOnly: true,
        onTap: () {
          onTap();
        },
        decoration: InputDecoration(
            hintText: hint,
            fillColor: AppColors.fieldBorderColor,
            filled: true,
            suffixIcon: const Icon(Icons.arrow_drop_down),
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
