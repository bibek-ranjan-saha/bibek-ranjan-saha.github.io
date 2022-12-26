// To parse this JSON data, do
//
//     final ipData = ipDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

IpData ipDataFromJson(String str) => IpData.fromJson(json.decode(str));

String ipDataToJson(IpData data) => json.encode(data.toJson());

class IpData {
  IpData({
    required this.status,
    required this.country,
    required this.countryCode,
    required this.region,
    required this.regionName,
    required this.city,
    required this.zip,
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.isp,
    required this.org,
    required this.ipDataAs,
    required this.query,
  });

  String status;
  String country;
  String countryCode;
  String region;
  String regionName;
  String city;
  String zip;
  double lat;
  double lon;
  String timezone;
  String isp;
  String org;
  String ipDataAs;
  String query;

  factory IpData.fromJson(Map<String, dynamic> json) => IpData(
    status: json["status"],
    country: json["country"],
    countryCode: json["countryCode"],
    region: json["region"],
    regionName: json["regionName"],
    city: json["city"],
    zip: json["zip"],
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
    timezone: json["timezone"],
    isp: json["isp"],
    org: json["org"],
    ipDataAs: json["as"],
    query: json["query"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "country": country,
    "countryCode": countryCode,
    "region": region,
    "regionName": regionName,
    "city": city,
    "zip": zip,
    "lat": lat,
    "lon": lon,
    "timezone": timezone,
    "isp": isp,
    "org": org,
    "as": ipDataAs,
    "query": query,
  };
}
