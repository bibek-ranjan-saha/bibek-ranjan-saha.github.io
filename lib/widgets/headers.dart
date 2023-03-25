import 'package:flutter/material.dart';
import 'package:seo/head_tag.dart';
import 'package:seo/html/seo_widget.dart';

import '../constants/values.dart';

class HeadText extends StatefulWidget {
  final String title;
  final int index;

  const HeadText({Key? key, required this.title, required this.index})
      : super(key: key);

  @override
  State<HeadText> createState() => _HeadTextState();
}

class _HeadTextState extends State<HeadText> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Seo.head(
      tags: const [
        MetaTag(
          name: 'title',
          content: 'Portfolio of Bibek Ranjan Saha in Flutter',
        ),
        LinkTag(
          rel: 'canonical',
          href: 'http://bibek-saha.web.app/',
        ),
      ],
      child: InkWell(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onHover: (hover) {
          setState(() {
            isHovered = hover;
          });
        },
        onTap: () {
          itemScrollController.scrollTo(
              index: widget.index,
              duration: const Duration(milliseconds: 365),
              curve: Curves.fastOutSlowIn);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            padding: const EdgeInsets.only(
              bottom: 2, // This can be the space you need between text and
              // underline
            ),
            decoration: BoxDecoration(
              border: isHovered
                  ? const Border(
                      bottom: BorderSide(
                        color: Colors.lightGreenAccent,
                        style: BorderStyle.solid,
                        width: 3, // This would be the width of the underline
                      ),
                    )
                  : null,
            ),
            child: Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

Widget blackFlutterLogo() {
  return const ColorFiltered(
    colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcATop),
    child: FlutterLogo(
      size: 100,
      duration: Duration(milliseconds: 2000),
      curve: Curves.easeInOutCirc,
    ),
  );
}
