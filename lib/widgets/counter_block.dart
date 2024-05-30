import 'package:assignment_9/widgets/time_card.dart';
import 'package:flutter/material.dart';

class CounterBlock extends StatelessWidget {
  final int seconds;

  const CounterBlock({
    super.key,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TimeCard(
            time: seconds ~/ 60,
          ),
          const Column(
            children: [
              Icon(Icons.circle),
              Icon(Icons.circle),
            ],
          ),
          TimeCard(
            time: seconds % 60,
          ),
        ],
      ),
    );
  }
}
