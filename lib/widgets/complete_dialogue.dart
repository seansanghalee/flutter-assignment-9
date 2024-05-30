import 'dart:io';

import 'package:flutter/material.dart';

class CompleteDialogue extends StatelessWidget {
  const CompleteDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      title: const Text(
        "🔥 Mission Complete 🔥",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Go take some rest, you beast.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            exit(0);
          },
          child: const Text(
            "OK",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
