// To parse this JSON data, do
//
//     final batteryData = batteryDataFromJson(jsonString);

import 'dart:convert';

BatteryData batteryDataFromJson(String str) => BatteryData.fromJson(json.decode(str));

String batteryDataToJson(BatteryData data) => json.encode(data.toJson());

class BatteryData {
  BatteryData({
    required this.charging,
    this.chargingTime,
    this.dischargingTime,
    required this.level,
    required this.status,
  });

  bool charging;
  int? chargingTime;
  int? dischargingTime;
  double level;
  bool status;

  factory BatteryData.fromJson(Map<String, dynamic> json) {
    return BatteryData(
      charging: json["charging"],
      chargingTime: json["chargingTime"],
      dischargingTime: json["dischargingTime"],
      level: json["level"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
    "charging": charging,
    "chargingTime": chargingTime,
    "dischargingTime": dischargingTime,
    "level": level,
    "status": status,
  };
}
