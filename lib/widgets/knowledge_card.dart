import 'package:bibek_ranjan_saha/widgets/seo_text.dart';
import 'package:flutter/material.dart';

import 'linear_progress.dart';

class KnowledgeCard extends StatelessWidget {
  final double skillValue;
  final String skillName;
  final bool showPercentage;

  const KnowledgeCard(
      {Key? key,
      required this.skillValue,
      required this.skillName,
      this.showPercentage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 9),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.label_important_outline_sharp,
                  color: Colors.white,
                ),
                Flexible(
                  child: CrazySeoText(
                    text: skillName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: LinearProgress(
                  value: skillValue,
                ),
              ),
              if (showPercentage)
                CrazySeoText(
                  text: "  ${100 * skillValue} %",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
