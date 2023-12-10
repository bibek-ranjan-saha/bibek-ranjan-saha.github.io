import 'dart:convert';
import 'dart:js' as js;

import 'package:Bibek/constants/values.dart';
import 'package:Bibek/models/user_details.dart';

import '../models/battery_data.dart';
import '../models/device_data.dart';
import '../models/repo_data.dart';
import '../models/statistics_data.dart';
import '../models/weather_data.dart';
import '../providers/data_provider.dart';
import 'base_client.dart';

class ApiRepo {
  static Future<UserDetails> getIpDataForStatistics(
      {int retryCount = RetryConstants.defaultRetryCount}) async {
    try {
      var data = await Api.instance.getData(
          "https://api.ipgeolocation.io/ipgeo?apiKey=4e28a84fc48644e68c5d885f3de64afa");
      return userDetailsFromJson(jsonEncode(data.data));
    } catch (e) {
      if (retryCount <= 0) {
        retryCount--;
        return getIpDataForStatistics(retryCount: retryCount);
      } else {
        return Future.error(e);
      }
    }
  }

  static Future<BatteryData?> getBatteryInfo(
      {int retryCount = RetryConstants.defaultRetryCount}) async {
    try {
      String data = "";
      await js.context.callMethod("getBatteryDataInternal", []);
      await Future.delayed(
        const Duration(seconds: 2),
        () {
          data = js.context.callMethod("returnBackBatteryData", []);
        },
      );
      return batteryDataFromJson(data);
    } catch (e) {
      if (retryCount <= 0) {
        retryCount--;
        return getBatteryInfo(retryCount: retryCount);
      } else {
        return Future.error(e);
      }
    }
  }

  static Future<DeviceData?> getSystemInfo(
      {int retryCount = RetryConstants.defaultRetryCount}) async {
    try {
      final userAgent = js.context.callMethod("getUserAgent", []);
      var data = await Api.instance.postData(
          "https://api.whatismybrowser.com/api/v2/user_agent_parse",
          needHeader: false,
          customHeader: {"X-API-KEY": "f10b54e9eb43faf0c63b43998dd23f13"},
          data: {"user_agent": userAgent});
      if (data.statusCode == 200) {
        return DeviceData.fromJson(data.data);
      }
    } catch (e) {
      if (retryCount <= 0) {
        retryCount--;
        return getSystemInfo(retryCount: retryCount);
      } else {
        return Future.error(e);
      }
    }
    return null;
  }

  static Future<String> getJoke(
      {int retryCount = RetryConstants.defaultRetryCount}) async {
    try {
      var data = await Api.instance.postData(
          "https://geek-jokes.sameerkumar"
          ".website/api",
          data: {});
      return data.data.toString();
    } catch (e) {
      if (retryCount <= 0) {
        retryCount--;
        return getJoke(retryCount: retryCount);
      } else {
        return Future.error(e);
      }
    }
  }

  static Future<List<RepoData>> getProjects(
      {int retryCount = RetryConstants.defaultRetryCount}) async {
    try {
      var data = await Api.instance
          .getData("https://api.github.com/users/bibek-ranjan-saha/repos");
      return repoDataFromJson(jsonEncode(data.data));
    } catch (e) {
      if (retryCount <= 0) {
        retryCount--;
        return getProjects(retryCount: retryCount);
      } else {
        return Future.error(e);
      }
    }
  }

  static Future<WeatherData?> getWeatherInfo(String city,
      {int retryCount = RetryConstants.defaultRetryCount}) async {
    try {
      var response = await Api.instance.getData(
          "https://api.openweathermap.org/data/2"
          ".5/weather?q=$city&units=metric&appid=0645404ec6534ea39e7720b364e0a25f");
      if (response.statusCode == 200) {
        var jsonString = response.data;
        return weatherDataFromJson(jsonEncode(jsonString));
      }
      return null;
    } catch (e) {
      if (retryCount <= 0) {
        retryCount--;
        return getWeatherInfo(city, retryCount: retryCount);
      } else {
        return Future.error(e);
      }
    }
  }

  static void getStats(UserDetails data, DataProvider provider,
      {int retryCount = RetryConstants.defaultRetryCount}) async {
    try {
      var response = await Api.instance.postData(
          "https://bibek-saha.onrender.com/api",
          data: data.toApiJson(),
          needHeader: true);
      if (response.data != null &&
          ((response.data is String) ? response.data.isNotEmpty : false)) {
        var stats = Statistics.fromJson(jsonDecode(response.data));
        provider.updateData(stats, hasFailed: false);
      }
    } catch (e) {
      if (retryCount <= 0) {
        retryCount--;
        getStats(data, provider, retryCount: retryCount);
      } else {
        provider.updateData(null, hasFailed: true);
      }
    }
  }

  static void getStatisticsUpdates(DataProvider provider,
      {int retryCount = RetryConstants.defaultRetryCount}) async {
    final socketClient = Api.instance.socket!;
    socketClient.on('dataUpdate', (data) {
      if (data != null && data.toString().isNotEmpty) {
        var stats = Statistics.fromJson(data);
        provider.updateData(stats, hasFailed: false);
      } else {
        provider.updateData(null, hasFailed: true);
      }
    });
  }

  static Future<String> getResume(
      {int retryCount = RetryConstants.defaultRetryCount}) async {
    try {
      var response = await Api.instance.getData(
          "https://bibek-ranjan-saha.github.io/apps_list/resume_link.json");
      return response.data["link"].toString();
    } catch (e) {
      if (retryCount <= 0) {
        retryCount--;
        return getResume(retryCount: retryCount);
      } else {
        return "";
      }
    }
  }

  static Future<DeviceData?> getUserDetails(String userAgent,
      {int retryCount = RetryConstants.defaultRetryCount}) async {
    try {
      var response = await Api.instance.postData("",
          data: {"user_agent": userAgent},
          needHeader: false,
          customHeader: {"X-API-KEY": "f10b54e9eb43faf0c63b43998dd23f13"});
      if (response.statusCode == 200) {
        var jsonString = response.data;
        return deviceDataFromJson(jsonEncode(jsonString));
      }
      return null;
    } catch (e) {
      if (retryCount <= 0) {
        retryCount--;
        return getUserDetails(userAgent, retryCount: retryCount);
      } else {
        return null;
      }
    }
  }
}
