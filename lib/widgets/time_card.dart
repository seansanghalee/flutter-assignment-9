import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final int time;

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
              "$time".padLeft(2, "0"),
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
