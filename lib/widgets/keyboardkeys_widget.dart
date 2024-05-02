import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final Color letterStatus;
  final String keyboardKey;
  const Keyboard(
      {required this.letterStatus, required this.keyboardKey, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 35,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Center(
        child: Text(
          keyboardKey,
          style: TextStyle(
            color: letterStatus,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
