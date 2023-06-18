import 'dart:convert';
import 'dart:js' as js;

import 'package:Bibek/models/user_details.dart';

import '../models/battery_data.dart';
import '../models/device_data.dart';
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

  static Future<BatteryData?> getBatteryInfo() async {
    String data = "";
    await js.context.callMethod("getBatteryDataInternal", []);
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        data = js.context.callMethod("returnBackBatteryData", []);
      },
    );
    return batteryDataFromJson(data);
  }

  static Future<DeviceData?> getSystemInfo() async {
    final userAgent = js.context.callMethod("getUserAgent", []);
    var data = await Api.instance.postData(
        "https://api.whatismybrowser.com/api/v2/user_agent_parse",
        needHeader: false,
        customHeader: {"X-API-KEY": "f10b54e9eb43faf0c63b43998dd23f13"},
        data: {"user_agent": userAgent});
    if (data.statusCode == 200) {
      return DeviceData.fromJson(data.data);
    }
    return null;
  }

  static Future<String> getJoke() async {
    var data = await Api.instance.postData(
        "https://geek-jokes.sameerkumar"
        ".website/api",
        data: {});
    return data.data.toString();
  }

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
          needHeader: true);
      if (response.data != null &&
          ((response.data is String) ? response.data.isNotEmpty : false)) {
        var stats = Statistics.fromJson(jsonDecode(response.data));
        provider.updateData(stats,hasFailed: false);
      }
    } catch (e) {
      provider.updateData(null,hasFailed: true);
    }
  }

  static void getStatisticsUpdates(DataProvider provider) async {
    final socketClient = Api.instance.socket!;
    socketClient.on('dataUpdate', (data) {
      if (data != null && data.toString().isNotEmpty) {
        var stats = Statistics.fromJson(data);
        provider.updateData(stats,hasFailed: false);
      } else {
        provider.updateData(null,hasFailed: true);
      }
    });
  }

  static Future<String> getResume() async {
    var response = await Api.instance
        .getData("https://bibek-ranjan-saha.github.io/apps_list/resume_link"
            ".json");
    return response.data["link"].toString();
  }

  static Future<DeviceData?> getUserDetails(String userAgent) async {
    var response = await Api.instance.postData("",
        data: {"user_agent": userAgent},
        needHeader: false,
        customHeader: {"X-API-KEY": "f10b54e9eb43faf0c63b43998dd23f13"});
    if (response.statusCode == 200) {
      var jsonString = response.data;
      return deviceDataFromJson(jsonEncode(jsonString));
    }
    return null;
  }
}
