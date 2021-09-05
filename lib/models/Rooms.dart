import 'dart:convert';

import 'package:short_stay/models/RoomDetails.dart';

class Rooms{
  Rooms({
    this.status,
    this.code,
    this.data
  });


  factory Rooms.fromJson(Map<String, dynamic> json) => Rooms(
      status: json['status'],
      code: json['code'],
      data: List<RoomsDetails>.from(json['data'].map((x) => RoomsDetails.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "status":status,
    "code":code,
    "data":List<dynamic>.from(data.map((e) => e.toJson()))
  };

  bool status;
  int code;
  List<RoomsDetails> data;
}

