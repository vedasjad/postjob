import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';

class FormFieldContainer extends StatelessWidget {
  const FormFieldContainer({
    required this.title,
    this.child,
    this.leading,
    super.key,
  });

  final String title;
  final Widget? child;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.borderColor,
              ),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                leading ?? const SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          child ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
