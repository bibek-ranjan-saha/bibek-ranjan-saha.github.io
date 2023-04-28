// To parse this JSON data, do
//
//     final deviceData = deviceDataFromJson(jsonString);

import 'dart:convert';

DeviceData deviceDataFromJson(String str) => DeviceData.fromJson(json.decode(str));

String deviceDataToJson(DeviceData data) => json.encode(data.toJson());

class DeviceData {
  DeviceData({
    required this.parse,
    required this.result,
  });

  Parse parse;
  Result result;

  factory DeviceData.fromJson(Map<String, dynamic> json) => DeviceData(
    parse: Parse.fromJson(json["parse"]),
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "parse": parse.toJson(),
    "result": result.toJson(),
  };
}

class Parse {
  Parse({
    this.simpleSoftwareString,
    this.simpleSubDescriptionString,
    this.simpleOperatingPlatformString,
    this.software,
    this.softwareName,
    this.softwareNameCode,
    this.softwareVersion,
    required this.softwareVersionFull,
    this.operatingSystem,
    this.operatingSystemName,
    this.operatingSystemNameCode,
    this.operatingSystemFlavour,
    this.operatingSystemFlavourCode,
    this.operatingSystemVersion,
    required this.operatingSystemVersionFull,
    required this.isAbusive,
    this.userAgent,
  });

  String? simpleSoftwareString;
  String? simpleSubDescriptionString;
  String? simpleOperatingPlatformString;
  String? software;
  String? softwareName;
  String? softwareNameCode;
  String? softwareVersion;
  List<String> softwareVersionFull;
  String? operatingSystem;
  String? operatingSystemName;
  String? operatingSystemNameCode;
  String? operatingSystemFlavour;
  String? operatingSystemFlavourCode;
  String? operatingSystemVersion;
  List<String> operatingSystemVersionFull;
  bool isAbusive;
  String? userAgent;

  factory Parse.fromJson(Map<String, dynamic> json) => Parse(
    simpleSoftwareString: json["simple_software_string"],
    simpleSubDescriptionString: json["simple_sub_description_string"],
    simpleOperatingPlatformString: json["simple_operating_platform_string"],
    software: json["software"],
    softwareName: json["software_name"],
    softwareNameCode: json["software_name_code"],
    softwareVersion: json["software_version"],
    softwareVersionFull: List<String>.from(json["software_version_full"].map((x) => x)),
    operatingSystem: json["operating_system"],
    operatingSystemName: json["operating_system_name"],
    operatingSystemNameCode: json["operating_system_name_code"],
    operatingSystemFlavour: json["operating_system_flavour"],
    operatingSystemFlavourCode: json["operating_system_flavour_code"],
    operatingSystemVersion: json["operating_system_version"],
    operatingSystemVersionFull: List<String>.from(json["operating_system_version_full"].map((x) => x)),
    isAbusive: json["is_abusive"],
    userAgent: json["user_agent"],
  );

  Map<String, dynamic> toJson() => {
    "simple_software_string": simpleSoftwareString,
    "simple_sub_description_string": simpleSubDescriptionString,
    "simple_operating_platform_string": simpleOperatingPlatformString,
    "software": software,
    "software_name": softwareName,
    "software_name_code": softwareNameCode,
    "software_version": softwareVersion,
    "software_version_full": List<dynamic>.from(softwareVersionFull.map((x) => x)),
    "operating_system": operatingSystem,
    "operating_system_name": operatingSystemName,
    "operating_system_name_code": operatingSystemNameCode,
    "operating_system_flavour": operatingSystemFlavour,
    "operating_system_flavour_code": operatingSystemFlavourCode,
    "operating_system_version": operatingSystemVersion,
    "operating_system_version_full": List<dynamic>.from(operatingSystemVersionFull.map((x) => x)),
    "is_abusive": isAbusive,
    "user_agent": userAgent,
  };
}

class Result {
  Result({
    required this.code,
    required this.messageCode,
    required this.message,
  });

  String? code;
  String? messageCode;
  String? message;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    code: json["code"],
    messageCode: json["message_code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message_code": messageCode,
    "message": message,
  };
}
