import 'dart:js' as js;

import 'package:Bibek/providers/data_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'apis.dart';

class AppService {
  static void launchAppUrl(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      js.context.callMethod("showAlert", ["\ncan not launch this $url"]);
    }
  }

  static void loadMyResume() async {
    String url = await ApiRepo.getResume();
    launchAppUrl(url);
  }

  static void sendSms() async {
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: '+917735336483',
      queryParameters: <String, String>{
        'body': Uri.encodeComponent(
            'Hii catching you up from your portfolio lets get to a call'),
      },
    );
    try {
      await launchUrl(smsLaunchUri);
    } catch (e) {
      js.context.callMethod("showAlert", ["\ncan't send message"]);
    }
  }

  static void launchEmail() async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'bibeksahabiki@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'From your Portfolio',
      }),
    );
    try {
      await launchUrl(emailLaunchUri);
    } catch (e) {
      js.context.callMethod("showAlert", ["\ncan't send mail"]);
    }
  }

  static void initiateAllApi(DataProvider provider) async {
    var ipData = await ApiRepo.getIpDataForStatistics();
    provider.updateIpData(ipData);
    var weatherData = await ApiRepo.getWeatherInfo(ipData.city);
    provider.updateWeather(weatherData);
    ApiRepo.getStats(ipData, provider);
    ApiRepo.getStatisticsUpdates(provider);
  }
}
