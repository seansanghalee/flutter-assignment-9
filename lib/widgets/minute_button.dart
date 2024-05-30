import 'package:flutter/material.dart';

class MinuteButton extends StatelessWidget {
  final int minute;
  final Color color;

  const MinuteButton({
    super.key,
    required this.minute,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
          ),
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
        child: Text(
          "$minute",
          style: TextStyle(
            color: color,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
