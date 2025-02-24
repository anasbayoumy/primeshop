import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 40,
      child: MaterialButton(
        onPressed: onPressed,
        color: const Color(0xffa600ff),
        textColor: Colors.white,
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: "Englishtwo",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
