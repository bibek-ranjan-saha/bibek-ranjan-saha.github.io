import 'package:flutter/material.dart';
import 'package:seo/html/seo_widget.dart';

class HeadText extends StatefulWidget {
  final GlobalKey childPointer;
  final String title;

  const HeadText({Key? key, required this.childPointer, required this.title})
      : super(key: key);

  @override
  State<HeadText> createState() => _HeadTextState();
}

class _HeadTextState extends State<HeadText> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Seo.text(
      text: 'bibek ranjan saha ${widget.title}',
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: GestureDetector(
          onTap: () {
            Scrollable.ensureVisible(widget.childPointer.currentContext!,
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn);
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
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
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
