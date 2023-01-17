import 'dart:convert';

import '../models/repo_data.dart';
import 'base_client.dart';

class ApiRepo {
  // Future<IpData> getIpData() async {
  //   var data = await Api.instance.client.get("https://ipinfo.io/json?token=9e2ab41fbf6195");
  //   return ipDataFromJson(jsonEncode(data.data));
  // }

  // Future<String> getJoke() async {
  //   var data = await Api.client.get(Uri.parse("https://geek-jokes.sameerkumar.website/api"));
  //   return data.body;
  // }

  Future<List<RepoData>> getProjects() async {
    var data = await Api.instance.client.get("https://api.github"
        ".com/users/bibek-ranjan-saha/repos");
    return repoDataFromJson(jsonEncode(data.data));
  }

  // Future<WeatherData?> getWeatherInfo(String city) async {
  //   var response = await Api.instance.client.get(
  //       "http://api.openweathermap.org/data/2"
  //       ".5/weather?q=$city&units=metric&appid=0645404ec6534ea39e7720b364e0a25f");
  //   if (response.statusCode == 200) {
  //     var jsonString = response.data;
  //     return weatherDataFromJson(jsonEncode(jsonString));
  //   }
  //   return null;
  // }

  // void getStats(IpData data, DataProvider provider) async {
  //   try {
  //     var response = await Api.instance.client.post(
  //       "https://bibek-saha.onrender.com/api",
  //       data: data.toJson(),
  //     );
  //     var stats = statisticsFromJson(jsonEncode(response.data));
  //     provider.updateData(stats!);
  //   } on Exception catch (e) {
  //     debugPrint("new data error $e");
  //   }
  // }
  //
  // void getStatisticsUpdates(BuildContext context) async {
  //   final socketClient = Api.instance.socket!;
  //   socketClient.on('dataUpdate', (data) {
  //     DataProvider provider = Provider.of<DataProvider>(context, listen: false);
  //     var stats = statisticsFromJson(jsonEncode(data));
  //     provider.updateData(stats!);
  //   });
  // }

  Future<String> getResume() async {
    var response = await Api.instance.client
        .get("https://bibek-ranjan-saha.github.io/apps_list/resume_link.json");
    return response.data["link"].toString();
  }
}
