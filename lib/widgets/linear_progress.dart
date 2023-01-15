import 'package:flutter/material.dart';

class LinearProgress extends StatelessWidget {
  final double value;

  const LinearProgress({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: LinearProgressIndicator(
          value: value, color: Colors.lightGreenAccent, minHeight: 12,
          backgroundColor : Colors.white70),
    );
  }
}
