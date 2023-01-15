// To parse this JSON data, do
//
//     final statistics = statisticsFromJson(jsonString);

import 'dart:convert';

Statistics? statisticsFromJson(String str) => Statistics.fromJson(json.decode(str));

String statisticsToJson(Statistics? data) => json.encode(data!.toJson());

class Statistics {
  Statistics({
    required this.totalCount,
    required this.id,
    required this.countries,
    required this.cities,
    required this.regions,
    required this.serviceProviders,
    required this.v,
  });

  int? totalCount;
  String? id;
  List<City?>? countries;
  List<City?>? cities;
  List<Region?>? regions;
  List<ServiceProvider?>? serviceProviders;
  int? v;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    totalCount: json["totalCount"],
    id: json["_id"],
    countries: json["countries"] == null ? [] : List<City?>.from(json["countries"]!.map((x) => City.fromJson(x))),
    cities: json["cities"] == null ? [] : List<City?>.from(json["cities"]!.map((x) => City.fromJson(x))),
    regions: json["regions"] == null ? [] : List<Region?>.from(json["regions"]!.map((x) => Region.fromJson(x))),
    serviceProviders: json["serviceProviders"] == null ? [] : List<ServiceProvider?>.from(json["serviceProviders"]!.map((x) => ServiceProvider.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "totalCount": totalCount,
    "_id": id,
    "countries": countries == null ? [] : List<dynamic>.from(countries!.map((x) => x!.toJson())),
    "cities": cities == null ? [] : List<dynamic>.from(cities!.map((x) => x!.toJson())),
    "regions": regions == null ? [] : List<dynamic>.from(regions!.map((x) => x!.toJson())),
    "serviceProviders": serviceProviders == null ? [] : List<dynamic>.from(serviceProviders!.map((x) => x!.toJson())),
    "__v": v,
  };
}

class City {
  City({
    required this.name,
    required this.count,
    required this.id,
  });

  String? name;
  int? count;
  String? id;

  factory City.fromJson(Map<String, dynamic> json) => City(
    name: json["name"],
    count: json["count"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "count": count,
    "_id": id,
  };
}

class Region {
  Region({
    required this.name,
    required this.code,
    required this.timeZone,
    required this.latlong,
    required this.count,
    required this.id,
  });

  String? name;
  String? code;
  String? timeZone;
  String? latlong;
  int? count;
  String? id;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    name: json["name"],
    code: json["code"],
    timeZone: json["timeZone"],
    latlong: json["latlong"],
    count: json["count"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "timeZone": timeZone,
    "latlong": latlong,
    "count": count,
    "_id": id,
  };
}

class ServiceProvider {
  ServiceProvider({
    required this.org,
    required this.ip,
    required this.count,
    required this.id,
  });

  String? org;
  String? ip;
  int? count;
  String? id;

  factory ServiceProvider.fromJson(Map<String, dynamic> json) => ServiceProvider(
    org: json["org"],
    ip: json["ip"],
    count: json["count"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "org": org,
    "ip": ip,
    "count": count,
    "_id": id,
  };
}
