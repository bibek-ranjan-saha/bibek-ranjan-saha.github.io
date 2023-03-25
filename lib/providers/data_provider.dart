import 'package:Bibek/models/user_details.dart';
import 'package:Bibek/models/weather_data.dart';
import 'package:flutter/cupertino.dart';

import '../models/statistics_data.dart';

class DataProvider extends ChangeNotifier {
  Statistics? _statistics;

  WeatherData? _weatherData;

  UserDetails? _ipData;

  void updateData(Statistics? stats) {
    _statistics = stats;
    notifyListeners();
  }

  void updateWeather(WeatherData? weatherData) {
    _weatherData = weatherData;
    notifyListeners();
  }

  void updateIpData(UserDetails? newData) {
    _ipData = newData;
    notifyListeners();
  }

  Statistics? get stats => _statistics;

  WeatherData? get weather => _weatherData;

  UserDetails? get ipData => _ipData;
}
