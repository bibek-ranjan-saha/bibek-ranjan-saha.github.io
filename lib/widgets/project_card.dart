import 'package:Bibek/services/app_service.dart';
import 'package:Bibek/widgets/seo_text.dart';
import 'package:flutter/material.dart';

import '../models/repo_data.dart';
import '../utils/util.dart';

class ProjectCard extends StatelessWidget {
  final RepoData e;

  const ProjectCard({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppService.launchAppUrl(e.htmlUrl);
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CrazySeoText(
                text: e.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.lightGreen,
                  fontSize: 22,
                ),
              ),
              CrazySeoText(
                text: e.description.length > 60
                    ? '${e.description.substring(0, 60)} ...'
                    : e.description,
                style: const TextStyle(fontSize: 14, color: Colors.white70),
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
                    text: e.language,
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
                    text: e.defaultBranch,
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
                    text: timeAgo(e.createdAt),
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
                    text: timeAgo(e.updatedAt),
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
                    text: e.watchersCount.toString(),
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
    );
  }
}
