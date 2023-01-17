import 'package:bibek_ranjan_saha/widgets/seo_text.dart';
import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final double value;
  final String skill;

  const CircularProgress({Key? key, required this.value, required this.skill})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    value: value,
                    color: Colors.lightGreenAccent,
                    strokeWidth: 8,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CrazySeoText(
                    text: "${100 * value} %",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CrazySeoText(
              text: skill,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}
