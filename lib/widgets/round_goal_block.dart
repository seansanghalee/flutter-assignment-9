import 'package:flutter/material.dart';

class RoundGoalBlock extends StatelessWidget {
  final int round;
  final int goal;

  const RoundGoalBlock({
    super.key,
    required this.round,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 36,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text("$round / 4"),
                ),
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "🤖 ROUND",
                    style: TextStyle(
                      color: Color(0xffb131fa),
                    ),
                  ),
                ),
              ],
            ),
            const VerticalDivider(
              thickness: 4,
              indent: 30,
              endIndent: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "$goal / 12",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "GOAL 🦾",
                    style: TextStyle(
                      color: Color(0xffb131fa),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
