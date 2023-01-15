import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seo/html/seo_widget.dart';

class CrazySeoText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const CrazySeoText({Key? key, required this.text, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? Seo.text(
            text: text,
            child: Text(text, style: style),
          )
        : Text(text,
            style: style?.copyWith(overflow: TextOverflow.ellipsis) ??
                const TextStyle(
                    overflow: TextOverflow.ellipsis, color: Colors.white));
  }
}
