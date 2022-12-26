import 'package:bibek_ranjan_saha/models/ip_data.dart';

import '../models/repo_data.dart';
import 'base_client.dart';

class ApiRepo {
  Future<IpData> getIpData() async {
    var data = await Api.client.get(Uri.parse("http://ip-api.com/json"));
    return ipDataFromJson(data.body);
  }

  // Future<String> getJoke() async {
  //   var data = await Api.client.get(Uri.parse("https://geek-jokes.sameerkumar.website/api"));
  //   return data.body;
  // }

  Future<List<RepoData>> getProjects() async {
    var data = await Api.client.get(Uri.parse("https://api.github"
        ".com/users/bibek-ranjan-saha/repos"));
    return repoDataFromJson(data.body);
  }

}
