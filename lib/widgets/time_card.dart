import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final String time;

  const TimeCard({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              time,
              style: const TextStyle(
                color: Color(0xff4a0074),
                fontSize: 69,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
