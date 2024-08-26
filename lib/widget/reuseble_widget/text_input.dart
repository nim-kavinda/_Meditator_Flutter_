import 'package:flutter/material.dart';
import 'package:meditor/utils/colors.dart';

class CustomtextFormFeild extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  const CustomtextFormFeild({
    super.key,
    required this.labelText,
    this.hintText,
    this.onSaved,
    this.validator,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryDarkBlue.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryDarkBlue),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyboardType,
    );
  }
}
