// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  UserDetails({
    required this.ip,
    required this.continentCode,
    required this.continentName,
    required this.countryCode2,
    required this.countryCode3,
    required this.countryName,
    required this.countryCapital,
    required this.stateProv,
    required this.district,
    required this.city,
    required this.zipcode,
    required this.latitude,
    required this.longitude,
    required this.isEu,
    required this.callingCode,
    required this.countryTld,
    required this.languages,
    required this.countryFlag,
    required this.isp,
    required this.connectionType,
    required this.organization,
    required this.currency,
    required this.timeZone,
  });

  String ip;
  String continentCode;
  String continentName;
  String countryCode2;
  String countryCode3;
  String countryName;
  String countryCapital;
  String stateProv;
  String district;
  String city;
  String zipcode;
  String latitude;
  String longitude;
  bool isEu;
  String callingCode;
  String countryTld;
  String languages;
  String countryFlag;
  String isp;
  String connectionType;
  String organization;
  Currency currency;
  TimeZone timeZone;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        ip: json["ip"],
        continentCode: json["continent_code"],
        continentName: json["continent_name"],
        countryCode2: json["country_code2"],
        countryCode3: json["country_code3"],
        countryName: json["country_name"],
        countryCapital: json["country_capital"],
        stateProv: json["state_prov"],
        district: json["district"],
        city: json["city"],
        zipcode: json["zipcode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        isEu: json["is_eu"],
        callingCode: json["calling_code"],
        countryTld: json["country_tld"],
        languages: json["languages"],
        countryFlag: json["country_flag"],
        isp: json["isp"],
        connectionType: json["connection_type"],
        organization: json["organization"],
        currency: Currency.fromJson(json["currency"]),
        timeZone: TimeZone.fromJson(json["time_zone"]),
      );

  Map<String, dynamic> toJson() => {
        "ip": ip,
        "continent_code": continentCode,
        "continent_name": continentName,
        "country_code2": countryCode2,
        "country_code3": countryCode3,
        "country_name": countryName,
        "country_capital": countryCapital,
        "state_prov": stateProv,
        "district": district,
        "city": city,
        "zipcode": zipcode,
        "latitude": latitude,
        "longitude": longitude,
        "is_eu": isEu,
        "calling_code": callingCode,
        "country_tld": countryTld,
        "languages": languages,
        "country_flag": countryFlag,
        "isp": isp,
        "connection_type": connectionType,
        "organization": organization,
        "currency": currency.toJson(),
        "time_zone": timeZone.toJson(),
      };

  Map<String, dynamic> toApiJson() {
    return {
      "country": getCorrectValue(countryName),
      "countryCode": getCorrectValue(countryCode2),
      "region": getCorrectValue(continentCode),
      "regionName": getCorrectValue(continentName),
      "city": getCorrectValue(city),
      "zip": getCorrectValue(zipcode),
      "lat": double.tryParse(latitude) ?? 0.0,
      "lon": double.tryParse(longitude) ?? 0.0,
      "timezone": getCorrectValue(timeZone.name),
      "isp": getCorrectValue(isp),
      "org": getCorrectValue(organization),
      "as": getCorrectValue(organization),
      "ip": getCorrectValue(ip)
    };
  }

  String getCorrectValue(String value)
  {
    return value.isEmpty ? "Unknown" : value;
  }
}

class Currency {
  Currency({
    required this.code,
    required this.name,
    required this.symbol,
  });

  String code;
  String name;
  String symbol;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "symbol": symbol,
      };
}

class TimeZone {
  TimeZone({
    required this.name,
    required this.offset,
    required this.currentTime,
    required this.currentTimeUnix,
    required this.isDst,
    required this.dstSavings,
  });

  String name;
  double offset;
  String currentTime;
  double currentTimeUnix;
  bool isDst;
  int dstSavings;

  factory TimeZone.fromJson(Map<String, dynamic> json) => TimeZone(
        name: json["name"],
        offset: json["offset"]?.toDouble(),
        currentTime: json["current_time"],
        currentTimeUnix: json["current_time_unix"]?.toDouble(),
        isDst: json["is_dst"],
        dstSavings: json["dst_savings"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "offset": offset,
        "current_time": currentTime,
        "current_time_unix": currentTimeUnix,
        "is_dst": isDst,
        "dst_savings": dstSavings,
      };
}
