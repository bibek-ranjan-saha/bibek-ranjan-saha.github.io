class Statistics {
  Statistics({
    required this.id,
    required this.totalCount,
    required this.countries,
    required this.cities,
    required this.regions,
    required this.serviceProviders,
    required this.v,
  });

  String id;
  int totalCount;
  List<City> countries;
  List<City> cities;
  List<Region> regions;
  List<ServiceProvider> serviceProviders;
  int v;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        id: json["_id"],
        totalCount: json["totalCount"],
        countries:
            List<City>.from(json["countries"].map((x) => City.fromJson(x))),
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
        regions:
            List<Region>.from(json["regions"].map((x) => Region.fromJson(x))),
        serviceProviders: List<ServiceProvider>.from(
            json["serviceProviders"].map((x) => ServiceProvider.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "totalCount": totalCount,
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
        "regions": List<dynamic>.from(regions.map((x) => x.toJson())),
        "serviceProviders":
            List<dynamic>.from(serviceProviders.map((x) => x.toJson())),
        "__v": v,
      };
}

class City {
  City({
    this.name,
    required this.count,
    required this.id,
  });

  String? name;
  int count;
  String id;

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
    this.name,
    this.code,
    this.timeZone,
    this.latlong,
    required this.count,
    required this.id,
  });

  String? name;
  String? code;
  String? timeZone;
  String? latlong;
  int count;
  String id;

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

  String org;
  String ip;
  int count;
  String id;

  factory ServiceProvider.fromJson(Map<String, dynamic> json) =>
      ServiceProvider(
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
