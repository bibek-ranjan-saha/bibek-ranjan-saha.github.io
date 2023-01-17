import 'package:flutter/cupertino.dart';
import 'package:seo/html/seo_widget.dart';

class CrazySeoImage extends StatelessWidget {
  final String src;
  final Widget child;

  const CrazySeoImage({Key? key, required this.src, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Seo.image(alt: "Bibek Ranjan Saha", src: src, child: child);
  }
}
