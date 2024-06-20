import 'package:flutter/material.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
    as inset;

import '../../../../../core/theme/colors.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    required this.hintText,
    required this.textEditingController,
    // required this.onChanged,
    this.textCapitalization = TextCapitalization.words,
    this.keyboardType = TextInputType.text,
    this.suffix,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.textInputAction,
    this.onFieldSubmitted,
    super.key,
  });

  final String hintText;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final Widget? suffix;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextEditingController textEditingController;
  final Function(String value)? onFieldSubmitted;
  // final Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: inset.BoxDecoration(
        border: Border.all(
          color: AppColors.borderColor,
        ),
        color: AppColors.fieldColor,
        boxShadow: const [
          inset.BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            inset: true,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        key: key,
        controller: textEditingController,
        cursorColor: Colors.red,
        style: const TextStyle(
          color: AppColors.hintTextColor,
          fontSize: 16,
          letterSpacing: 1,
          fontWeight: FontWeight.w300,
        ),
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        textInputAction: textInputAction ?? TextInputAction.next,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.hintTextColor,
            fontSize: 16,
            letterSpacing: 1,
            fontWeight: FontWeight.w300,
          ),
          suffix: suffix,
        ),
        onFieldSubmitted: onFieldSubmitted,
        // onChanged: onChanged,
      ),
    );
  }
}
