// To parse this JSON data, do
//
//     final ipData = ipDataFromJson(jsonString);

import 'dart:convert';

IpData ipDataFromJson(String str) => IpData.fromJson(json.decode(str));

String ipDataToJson(IpData data) => json.encode(data.toJson());

class IpData {
  IpData({
    required this.ip,
    required this.city,
    required this.region,
    required this.country,
    required this.loc,
    required this.org,
    required this.postal,
    required this.timezone,
  });

  String? ip;
  String? city;
  String? region;
  String? country;
  String? loc;
  String? org;
  String? postal;
  String? timezone;

  factory IpData.fromJson(Map<String, dynamic> json) => IpData(
        ip: json["ip"],
        city: json["city"],
        region: json["region"],
        country: json["country"],
        loc: json["loc"],
        org: json["org"],
        postal: json["postal"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "ip": ip,
        "city": city,
        "region": region,
        "country": country,
        "loc": loc,
        "org": org,
        "postal": postal,
        "timezone": timezone,
      };
}
