import 'dart:async';

import 'package:flutter/material.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  static const int defaultSeconds = 1500;
  int totalSeconds = defaultSeconds; // 25분
  late Timer timer;
  bool isRunning = false;
  int totalPomondoro = 0;

  void onTick(Timer timer) {
    setState(() {
      if (totalSeconds == 0) {
        totalSeconds = defaultSeconds;
        timer.cancel();
        ++totalPomondoro;
        isRunning = false;
      } else {
        --totalSeconds;
      }
    });
  }

  void onStartTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);

    setState(() {
      isRunning = true;
    });
  }

  void onPauseTimer() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onReset() {
    onPauseTimer();
    setState(() {
      totalSeconds = defaultSeconds;
    });
  }

  String formatTime(int seconds) {
    var duration = Duration(seconds: seconds);
    var secondsFormat = "${duration.inSeconds % 60}";
    secondsFormat =
        secondsFormat.length < 2 ? "0$secondsFormat" : secondsFormat;

    return "${duration.inMinutes}:$secondsFormat";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                formatTime(totalSeconds),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: [
                Center(
                  child: IconButton(
                    onPressed: isRunning ? onPauseTimer : onStartTimer,
                    icon: Icon(
                      isRunning
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline,
                      color: Theme.of(context).cardColor,
                    ),
                    iconSize: 120,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Theme.of(context).cardColor),
                  ),
                  onPressed: onReset,
                  child: Text(
                    "RESET",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.displayLarge?.color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                              "Pomodoro",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.color,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Flexible(
                            flex: 1,
                            child: SizedBox(
                              height: 100,
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Text(
                              "$totalPomondoro",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.color,
                                fontSize: 45,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
