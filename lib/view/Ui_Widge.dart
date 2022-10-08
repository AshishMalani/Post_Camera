import 'package:flutter/material.dart';

class UiWideget extends StatefulWidget {
  const UiWideget({Key? key}) : super(key: key);

  @override
  State<UiWideget> createState() => _UiWidegetState();
}

class _UiWidegetState extends State<UiWideget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints.loose(
                Size.square(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
