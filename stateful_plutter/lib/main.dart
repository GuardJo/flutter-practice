import 'package:flutter/material.dart';

void main() {
  runApp(const RootWidget());
}

class RootWidget extends StatefulWidget {
  const RootWidget({super.key});

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int count = 0;

  void onClick() {
    setState(() {
      count = count + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontSize: 40,
            color: Colors.blue.shade300,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.amber.shade50,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const CountTitle(),
                  Text(
                    "$count",
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: onClick,
                    iconSize: 30,
                    icon: const Icon(
                      Icons.add_box_rounded,
                    ),
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

class CountTitle extends StatelessWidget {
  const CountTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Click Count!",
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
        color: Theme.of(context).textTheme.titleMedium?.color,
      ),
    );
  }
}
