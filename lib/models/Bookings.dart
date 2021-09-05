import 'dart:convert';

import 'package:short_stay/models/UserBookings.dart';


class Bookings{
  Bookings({
    this.status,
    this.code,
    this.data
  });


  factory Bookings.fromJson(Map<String, dynamic> json) => Bookings(
    status: json["status"],
    code: json["code"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status":status,
    "code":code,
    "data":data
  };

  bool status;
  int code;
  dynamic data;
}