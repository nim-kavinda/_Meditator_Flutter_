import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meditor/models/sleep_exercise_model.dart';
import 'package:meditor/utils/colors.dart';

class SleepExerciseTimer extends StatefulWidget {
  final SleepExercise sleepExercise;
  const SleepExerciseTimer({
    super.key,
    required this.sleepExercise,
  });

  @override
  State<SleepExerciseTimer> createState() => _SleepExerciseTimerState();
}

class _SleepExerciseTimerState extends State<SleepExerciseTimer> {
  Timer? _timer;

  int _remainingTime = 0;
  bool _isRunning = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _remainingTime = widget.sleepExercise.duration * 60;
  }

  //method to statrt the timer
  void _statrtTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }

    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  //method to pause the timer
  void _pausetime() {
    if (_timer != null) {
      _timer!.cancel();
      _isRunning = false;
    }
  }

  //method to stop the time
  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _remainingTime = widget.sleepExercise.duration * 60;
      _isRunning = false;
    });
  }

  String _formatTime(int second) {
    final int minites = second ~/ 60;
    final int remeiningSeconds = second % 60;

    return "$minites:${remeiningSeconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Story Timer'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.sleepExercise.category,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryPurple,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.sleepExercise.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Duration: ${widget.sleepExercise.duration} minutes',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.sleepExercise.description,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  _formatTime(_remainingTime),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isRunning ? _pausetime() : _statrtTimer();
                      });
                    },
                    child: Text(
                      _isRunning
                          ? "Pause"
                          : (_remainingTime < widget.sleepExercise.duration * 60
                              ? "Resume"
                              : "statrt"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _stopTimer,
                    child: const Text('Stop'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
