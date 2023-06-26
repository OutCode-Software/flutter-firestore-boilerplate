import 'package:flutter/material.dart';
import '../../base/utils/app_spacing.dart';
import '../../base/utils/colors.dart';

import 'text_view.dart';

Widget formField(
  BuildContext context, {
  required String placeholder,
  required String hint,
  required TextEditingController controller,
  required bool doValidate,
  required bool editable,
  int lines = 1,
  bool isPassword = false,
  bool isObscureText = false,
  Function()? onPasswordVisibleClick,
  TextInputType selection = TextInputType.text,
  TextInputAction action = TextInputAction.next,
  FieldValidationRules setRules = FieldValidationRules.mandatoryField,
  bool showPlaceHolder = true,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Visibility(
        visible: showPlaceHolder,
        child: textViewComponent(
          text: placeholder,
          fontWeight: FontWeight.normal,
          textColor: AppColors.primaryElementColor,
          fontSize: 17,
        ),
      ),
      AppSpacing.verticalSpacing8,
      TextFormField(
        readOnly: !editable,
        maxLines: lines,
        keyboardType: selection,
        obscureText: isObscureText,
        textInputAction: action,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: onPasswordVisibleClick,
              child: Visibility(
                visible: isPassword,
                child: Icon(
                    isObscureText ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            hintText: hint,
            fillColor: AppColors.fieldBorderColor,
            filled: true,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8)))),
        validator: (value) {
          if (doValidate) {
            if (value == null || value.isEmpty) {
              return '$placeholder cannot be empty';
            }
            if (setRules == FieldValidationRules.email) {
              if (!RegExp(emailRegex).hasMatch(value.trim())) {
                return "Invalid Email Address";
              }
            } else if (setRules == FieldValidationRules.password) {
              if (!RegExp(passwordRegex).hasMatch(value.trim())) {
                return "Invalid password";
              }
            } else if (setRules == FieldValidationRules.phone) {
              if (!RegExp(phoneRegex).hasMatch(value.trim())) {
                return "Invalid phone number";
              }
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

enum FieldValidationRules { mandatoryField, email, password, phone }

const phoneRegex = "^[0-9]{10,10}\$";
const passwordRegex =
    "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}\$";
const emailRegex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}\$";
