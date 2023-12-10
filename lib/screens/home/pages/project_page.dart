import 'package:animate_do/animate_do.dart';
import 'package:Bibek/models/repo_data.dart';
import 'package:Bibek/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../services/apis.dart';
import '../../../widgets/seo_text.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
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
            child: FutureBuilder<List<RepoData>>(
              future: ApiRepo.getProjects(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.waiting) {
                  if (snapshot.data?.isEmpty ?? true) {
                    return const Text(
                      "Something went wrong may be github is down or your isp has blocked github",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w900),
                    );
                  } else {
                    return StaggeredGrid.count(
                      crossAxisCount: ((size.width) / 350).round() <= 0
                          ? 1
                          : ((size.width) / 350).round(),
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      children: [
                        for (RepoData e in snapshot.data ?? [])
                          if (!e.fork)
                            FadeInUp(
                              delay: Duration(
                                milliseconds:
                                    200 * (snapshot.data?.indexOf(e) ?? 1),
                              ),
                              child: ProjectCard(e: e),
                            )
                      ],
                    );
                  }
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: LinearProgressIndicator(minHeight: 6),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Wait for it..",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 20),
                        )
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
