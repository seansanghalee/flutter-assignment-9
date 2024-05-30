import 'package:assignment_9/helpers/helpers.dart';
import 'package:assignment_9/widgets/time_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            time: Helpers.getMinutes(seconds: seconds),
          ),
          const DefaultTextStyle(
            style: TextStyle(
              fontSize: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text("🔮"),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text("🔮"),
                ),
              ],
            ),
          ),
          TimeCard(
            time: Helpers.getSeconds(seconds: seconds),
          ),
        ],
      ),
    );
  }
}
