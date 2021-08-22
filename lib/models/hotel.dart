import 'dart:convert';

import 'package:short_stay/models/HotelDetails.dart';

// Hotel hotelsFromJson(String str) => Hotel.fromJson(json.decode(str));

class Hotel{
  Hotel({
    this.status,
    this.code,
    this.data
  });


  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
    status: json["status"],
    code: json["code"],
    data: List<HotelDetails>.from(json["data"].map((x) => HotelDetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status":status,
    "code":code,
    "data":List<dynamic>.from(data.map((e) => e.toJson()))
  };

  bool status;
  int code;
  List<HotelDetails> data;
}