import 'package:flutter/material.dart';

class HiddenWord extends StatelessWidget {
  final bool hidden;
  final String letter;
  const HiddenWord({required this.letter, required this.hidden, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 45,
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: Opacity(
        opacity: hidden ? 0 : 1,
        child: Center(
            child: Text(
          letter,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
