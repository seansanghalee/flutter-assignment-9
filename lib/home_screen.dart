import 'dart:async';

import 'package:assignment_9/helpers/helpers.dart';
import 'package:assignment_9/widgets/complete_dialogue.dart';
import 'package:assignment_9/widgets/counter_block.dart';
import 'package:assignment_9/widgets/minute_button.dart';
import 'package:assignment_9/widgets/round_goal_block.dart';
import 'package:assignment_9/widgets/title_block.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;

  List<int> minutes = [15, 20, 25, 30, 35];

  int _round = 3; // initially set to 3 to check round complete feature
  int _goal = 11; // initially set to 11 to check goal complete feature
  int _choice = 0;

  int _totalSeconds = Helpers.convertMinToSec(minutes: 15);

  bool _isPaused = true;
  bool _isResting = false;

  void _onMinuteButtonTap(int index) {
    if (!_isPaused || _isResting) {
      return;
    } else {
      setState(() {
        _choice = index;
        _totalSeconds = Helpers.convertMinToSec(minutes: minutes[_choice]);
      });
    }
  }

  void _onTick(Timer timer) {
    if (_totalSeconds == 0) {
      setState(() {
        timer.cancel();

        if (_isResting) {
          _isPaused = true;
          _totalSeconds = Helpers.convertMinToSec(minutes: minutes[_choice]);
          _round += 1;

          if (_round == 4) {
            // reset round count and increase goal count
            _round = 0;
            _goal += 1;
          }

          if (_goal == 12) {
            showDialog(
                context: context,
                barrierDismissible:
                    true, // true = touch anywhere outside of dialogue to dismiss
                builder: (context) => const CompleteDialogue());
          }
        } else {
          _totalSeconds = Helpers.convertMinToSec(minutes: 5);
          _timer = Timer.periodic(
            const Duration(seconds: 1),
            _onTick,
          );
        }

        _isResting = !_isResting;
      });
    } else {
      setState(() {
        _totalSeconds -= 1;
      });
    }
  }

  void _onStartPressed() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      _onTick,
    );

    setState(() {
      _isPaused = false;
    });
  }

  void _onPausePressed() {
    _timer.cancel();

    setState(() {
      _isPaused = true;
    });
  }

  void _onResetPressed() {
    if (!_isPaused || _isResting) {
      return;
    } else {
      setState(() {
        _totalSeconds = Helpers.convertMinToSec(minutes: minutes[_choice]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const TitleBlock(),
              CounterBlock(
                seconds: _totalSeconds,
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text("How many minutes do you want to focus for?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Flexible(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: minutes.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => _onMinuteButtonTap(index),
                    child: MinuteButton(
                      minute: minutes[index],
                      color: _choice == index ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(
                        24,
                      ),
                      iconSize: 120,
                      color: const Color(0xffff1cc0),
                      onPressed: _isPaused ? _onStartPressed : _onPausePressed,
                      icon: Icon(_isPaused
                          ? Icons.play_circle_outline
                          : Icons.pause_circle_outline),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextButton(
                        onPressed: _onResetPressed,
                        child: Text(
                          _isResting ? "Charging 🪫" : "Reset 🔋",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              RoundGoalBlock(
                round: _round,
                goal: _goal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
