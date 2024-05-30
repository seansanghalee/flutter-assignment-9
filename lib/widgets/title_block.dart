import 'package:flutter/material.dart';

class TitleBlock extends StatelessWidget {
  const TitleBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const Flexible(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "👾 PUNKODORO 👾",
            style: TextStyle(
              color: Color(0xffb131fa),
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
