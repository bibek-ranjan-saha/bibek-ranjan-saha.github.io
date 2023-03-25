import 'package:Bibek/widgets/seo_text.dart';
import 'package:flutter/material.dart';

import '../constants/values.dart';

class CrazyListTile extends StatelessWidget {
  final String title;
  final int index;

  const CrazyListTile({Key? key, required this.title, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
        onTap: () {
          itemScrollController.scrollTo(
              index: index,
              duration: const Duration(milliseconds: 365),
              curve: Curves.fastOutSlowIn);
          Navigator.pop(context);
        },
        minLeadingWidth: 6,
        leading: Container(
          decoration: BoxDecoration(
              color: Colors.lightGreenAccent,
              borderRadius: BorderRadius.circular(25)),
          height: 30,
          width: 6,
        ),
        contentPadding: EdgeInsets.zero,
        tileColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: CrazySeoText(text: title),
      ),
    );
  }
}
