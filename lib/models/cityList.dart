import 'dart:convert';

import 'package:short_stay/models/Cities.dart';

class City {
  City({
    this.status,
    this.code,
    this.data,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    status: json["status"],
    code: json["code"],
    data: List<Cities>.from(json["data"].map((x) => Cities.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status":status,
    "code":code,
    "data":List<dynamic>.from(data.map((e) => e.toJson()))
      };
  bool status;
  int code;
  List<Cities> data;
}
