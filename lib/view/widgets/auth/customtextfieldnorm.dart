import 'package:flutter/material.dart';

class CustomtextfieldNorm extends StatelessWidget {
  final String hint;
  final Widget prefixIcon;
  final TextEditingController myController;
  final String? Function(String?) valid;
  final bool isNumber;

  const CustomtextfieldNorm({
    super.key,
    required this.hint,
    required this.prefixIcon,
    required this.myController,
    required this.valid,
    required this.isNumber,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: valid,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hint,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }
}
