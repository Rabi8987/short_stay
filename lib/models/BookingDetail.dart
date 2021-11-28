import 'dart:convert';

import 'package:http/http.dart' as http;

class BookingDetail {
  int id;
  String checkIn;
  String checkOut;
  String mobile;
  String email;
  int userId;
  int roomId;
  String checkInTime;
  String checkOutTime;

  BookingDetail({
    this.id,
    this.checkIn,
    this.checkOut,
    this.mobile,
    this.email,
    this.userId,
    this.roomId,
    this.checkInTime,
    this.checkOutTime
  });
  factory BookingDetail.fromJson(Map<String, dynamic> json) => BookingDetail(
      id:json["id"],
      checkIn:json["checkIn"],
      checkOut:json["checkOut"],
      mobile:json["mobile"],
      email:json["email"],
      userId:json["userId"],
      roomId: json["roomId"],
      checkInTime: json["checkInTime"],
      checkOutTime: json["checkOutTime"]
  );

  Map<String, dynamic> toJson() => {
    "id":id,
    "checkIn":checkIn,
    "checkOut":checkOut,
    "mobile":mobile,
    "email":email,
    "userId":userId,
    "roomId":roomId,
    "checkInTime":checkInTime,
    "checkOutTime":checkOutTime
  };

}
