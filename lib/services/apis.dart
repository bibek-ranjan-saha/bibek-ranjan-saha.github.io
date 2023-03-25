import 'dart:convert';

import 'package:Bibek/models/user_details.dart';
import 'package:flutter/material.dart';

import '../models/repo_data.dart';
import '../models/statistics_data.dart';
import '../models/weather_data.dart';
import '../providers/data_provider.dart';
import 'base_client.dart';

class ApiRepo {
  static Future<UserDetails> getIpDataForStatistics() async {
    var data = await Api.instance.getData(
        "https://api.ipgeolocation.io/ipgeo?apiKey=4e28a84fc48644e68c5d885f3de64afa");
    return userDetailsFromJson(jsonEncode(data.data));
  }

  static Future<String> getJoke() async {
    var data = await Api.instance.getData("https://geek-jokes.sameerkumar"
        ".website/api");
    return data.data.toString();
  }

  // static void getIpData() async {
  //   Response? data;
  //
  //   try {
  //     data =
  //         await Api.instance.getData("https://bibek-saha.onrender.com/test_ip");
  //     js.context.callMethod("showAlert", ["$data"]);
  //   } catch (e) {
  //     js.context.callMethod("showAlert", ["$data with error $e"]);
  //   }
  // }

  static Future<List<RepoData>> getProjects() async {
    var data = await Api.instance.getData("https://api.github"
        ".com/users/bibek-ranjan-saha/repos");
    return repoDataFromJson(jsonEncode(data.data));
  }

  static Future<WeatherData?> getWeatherInfo(String city) async {
    var response = await Api.instance.getData(
        "https://api.openweathermap.org/data/2"
            ".5/weather?q=$city&units=metric&appid=0645404ec6534ea39e7720b364e0a25f");
    if (response.statusCode == 200) {
      var jsonString = response.data;
      return weatherDataFromJson(jsonEncode(jsonString));
    }
    return null;
  }

  static void getStats(UserDetails data, DataProvider provider) async {
    try {
      var response = await Api.instance.postData(
        "https://bibek-saha.onrender.com/api",
        data: data.toApiJson(),
        needHeader: true
      );
      var stats = statisticsFromJson(jsonEncode(response.data));
      provider.updateData(stats);
    } catch (e) {
      debugPrint("new data error $e ${data.toApiJson()}");
    }
  }

  static void getStatisticsUpdates(DataProvider provider) async {
    final socketClient = Api.instance.socket!;
    socketClient.on('dataUpdate', (data) {
      var stats = statisticsFromJson(jsonEncode(data));
      provider.updateData(stats);
    });
  }

  static Future<String> getResume() async {
    var response = await Api.instance
        .getData("https://bibek-ranjan-saha.github.io/apps_list/resume_link"
            ".json");
    return response.data["link"].toString();
  }
}
