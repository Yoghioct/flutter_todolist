import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      this.labelText,
      this.controller,
      this.hintText,
      this.maxLines,
      this.readOnly = false,
      this.suffixIcon});

  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool readOnly;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Text('Task title'),
        TextField(
          readOnly: readOnly,
          controller: controller,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          maxLines: maxLines,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            suffixIcon: suffixIcon,
            floatingLabelStyle: TextStyle(
              fontSize: 20,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 24,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: readOnly
                    ? Colors.transparent
                    : Theme.of(context)
                        .primaryColor, // Change color based on readOnly state
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onChanged: (value) {},
        ),
        const Gap(18),
      ],
    );
  }
}
