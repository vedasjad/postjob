import 'package:flutter/material.dart';

import '../../../../../../core/enums/enums.dart';
import '../../../../../../core/theme/colors.dart';

class MyDropDownButton<T extends Enum> extends StatelessWidget {
  const MyDropDownButton({
    required this.value,
    required this.enumValues,
    required this.onChanged,
    super.key,
  });

  final T value;
  final List<T> enumValues;
  final Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: value,
      alignment: Alignment.center,
      isExpanded: true,
      style: const TextStyle(
        color: AppColors.hintTextColor,
        fontSize: 16,
        letterSpacing: 1,
        fontWeight: FontWeight.w300,
      ),
      dropdownColor: Colors.black,
      icon: const SizedBox.shrink(),
      underline: const SizedBox.shrink(),
      items: enumValues.map((T enumValue) {
        return DropdownMenuItem<T>(
          value: enumValue,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              enumToString(enumValue),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
