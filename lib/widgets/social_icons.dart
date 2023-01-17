import 'package:bibek_ranjan_saha/widgets/seo_image.dart';
import 'package:bibek_ranjan_saha/widgets/seo_text.dart';
import 'package:bibek_ranjan_saha/widgets/triangle.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatefulWidget {
  final String icon;
  final String uri;
  final String msg;
  final Color color;

  const SocialIcons({
    Key? key,
    required this.icon,
    required this.uri,
    required this.msg,
    required this.color,
  }) : super(key: key);

  @override
  State<SocialIcons> createState() => _SocialIconsState();
}

class _SocialIconsState extends State<SocialIcons> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launchUrl(Uri.parse(widget.uri));
      },
      onHover: (hover) {
        setState(() {
          isHovered = hover;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 365),
            reverseDuration: const Duration(milliseconds: 365),
            child: isHovered
                ? Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: CrazySeoText(
                              text: widget.msg,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w800)),
                        ),
                      ),
                      ClipPath(
                        clipper: TriangleClipper(),
                        child: Container(
                          width: 10,
                          height: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ),
          AnimatedContainer(
            decoration: BoxDecoration(
              color: isHovered ? widget.color : Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            duration: const Duration(milliseconds: 365),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CrazySeoImage(
                src: widget.icon,
                child: Image.asset(
                  widget.icon,
                  width: 36,
                  height: 36,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
