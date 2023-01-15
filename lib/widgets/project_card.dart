import 'dart:ui';

import 'package:bibek_ranjan_saha/widgets/seo_text.dart';
import 'package:flutter/material.dart';

import '../models/repo_data.dart';
import '../utils/util.dart';

class ProjectCard extends StatefulWidget {
  final RepoData e;

  const ProjectCard({Key? key, required this.e}) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      // onHover: (hovered) {
      //   debugPrint(" value is    $hovered");
      //   setState(() {
      //     isHovered = true;
      //   });
      //   debugPrint(" value was     $hovered and status was $isHovered");
      // },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: !isHovered
                ? ImageFilter.blur(sigmaX: 10, sigmaY: 10)
                : ImageFilter.blur(),
            child: AnimatedContainer(
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                  color: !isHovered ? Colors.transparent : Colors.white,
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius:
                      BorderRadius.all(Radius.circular(isHovered ? 18 : 8))),
              duration: const Duration(milliseconds: 265),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CrazySeoText(
                    text: widget.e.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.lightGreen,
                      fontSize: 22,
                    ),
                  ),
                  CrazySeoText(
                    text: widget.e.description.length > 60
                        ? '${widget.e.description.substring(0, 60)} ...'
                        : widget.e.description,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CrazySeoText(
                        text: "Coded in : ",
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      CrazySeoText(
                        text: widget.e.language,
                        style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CrazySeoText(
                        text: "Lookup branch : ",
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      CrazySeoText(
                        text: widget.e.defaultBranch,
                        style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CrazySeoText(
                        text: "Started in : ",
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      CrazySeoText(
                        text: timeAgo(widget.e.createdAt),
                        style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CrazySeoText(
                        text: "Doing till : ",
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      CrazySeoText(
                        text: timeAgo(widget.e.updatedAt),
                        style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CrazySeoText(
                        text: "Current watch : ",
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      CrazySeoText(
                        text: widget.e.watchersCount.toString(),
                        style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
