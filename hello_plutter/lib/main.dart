import 'package:flutter/material.dart';

void main() {
  runApp(RootWidget());
}

class RootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Bar"),
          centerTitle: true,
        ),
        body: Center(
          child: Text("Hello Flutter"),
        ),
      ),
    );
  }
}
