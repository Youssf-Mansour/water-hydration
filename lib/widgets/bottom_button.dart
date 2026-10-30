import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;

  const BottomButton({
    super.key,
    required this.buttonTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: const Color(0xFF00E5FF),
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 65.0,
        child: Center(
          child: Text(
            buttonTitle.toUpperCase(),
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Color(0xFF0A0E21),
            ),
          ),
        ),
      ),
    );
  }
}
