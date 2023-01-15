import 'package:bibek_ranjan_saha/models/repo_data.dart';
import 'package:bibek_ranjan_saha/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/seo_text.dart';

class ProjectPage extends StatelessWidget {
  final Size size;
  final List<RepoData> projects;

  const ProjectPage(
      {required Key key, required this.size, required this.projects})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: const [
                Flexible(
                  child: CrazySeoText(
                    text: "My Projects on Github",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_circle_right_rounded,
                  color: Colors.white,
                  size: 32,
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 2)),
            padding: const EdgeInsets.all(10),
            // width: size.width < 600 ? size.width - 40 : size.width * 0.7,
            child: StaggeredGrid.count(
              crossAxisCount: ((size.width) / 350).round(),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: [
                for (RepoData e in projects)
                  if (!e.fork) ProjectCard(e: e)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
