import 'package:flutter/material.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
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
                "25:00",
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
            child: Center(
              child: IconButton(
                onPressed: () => {}, // TODO 기능 구현
                icon: Icon(
                  Icons.play_circle_outline,
                  color: Theme.of(context).cardColor,
                ),
                iconSize: 120,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
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
                              "0 / 1",
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
