import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_stay/models/BookingDetail.dart';
import 'package:short_stay/models/Bookings.dart';
import 'package:short_stay/models/HotelDetails.dart';
import 'package:short_stay/models/RoomDetails.dart';
import 'package:short_stay/models/Rooms.dart';
import 'package:short_stay/models/hotel.dart';
import 'package:short_stay/models/User.dart';

class Api {
  var client = http.Client();

  Future<Hotel> getHotels() async {
    var response = await client.post('http://www.shortstay.pk/shortstay/api/all-hotels',
      body: jsonEncode({
        'longitude':70.9817,
        'latitude':68.12324
      })
    );
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      print(jsonMap);
      var hotels = Hotel.fromJson(jsonMap);
      return hotels;
    }else{
      return null;
    }
  }
  // {status: true, code: 200, message: Hotels fetched, data: [{hotel_name: Cosy Beach Hotel, hotel_descriptions: A very delightful hotel and all, total_rooms: 15, available_rooms: 15, address: Club road, Karachi, longitude: 10.78616, latitude: 70.78616, amenities: [wifi, ac, clean bath], hotel_images: [http://shortstay.pk/shortstay/storage/app/hotel_images/ToHKQhRAvSsMa11ItZT9gPo94VmLuJ3etczFcULb.jpg, http://shortstay.pk/shortstay/storage/app/hotel_images/dIU4xn87mnVPKrpFQBDhzS7yNCV2Kqnz4hTUCO4G.jpg, http://shortstay.pk/shortstay/storage/app/hotel_images/2tufxUNhPRtyRJT7ZYgDM01vpZB5Ey0JHC0qAIet.jpg], rating: null, created_at: 2021-06-03 09:37:57, unique_prefix: cbh762}, {hotel_name: Cosy Beach Hotel, hotel_descriptions: A very delightful hotel and all, total_rooms: 15, available_rooms: 15, address: Tariq road, Karachi, longitude: 10.78616, latitude: 70.78616, amenities: [wifi, ac, clean bath, breakfast, secure location], hotel_images: [http://shortstay.pk/shortstay/storage/app/hotel_images/ToHKQhRAvSsMa11ItZT9gP
  Future<Rooms> getHotelRooms(String uniqueId) async {
    print("api function");
    print(uniqueId);
    var response = await client.post('http://www.shortstay.pk/shortstay/api/all-room',
      body: jsonEncode({
        'unique_prefix': uniqueId
      }),
      headers: {
        "content-type": "application/json"
      }
    );
    if(response.statusCode == 200){
      print("andar");
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
       print(jsonMap);

      var rooms = Rooms.fromJson(jsonMap);
      print("chal ja");
      print(rooms);
      return rooms;
    }else{
      return null;
    }
  }

  Future<User> registerUser(User user) async {
      var response = await http.post("http://shortstay.pk/shortstay/api/sign-up",
          body: jsonEncode({
            "name":user.name,
            "username":user.username,
            "mobile": user.mobile,
            "email":user.email,
            "address":user.address,
            "password":user.password,
          }),
          headers: {
            "content-type": "application/json"
          }
      );
      if(response.statusCode == 200){
        var jsonString = response.body;
        print(response.body);
        var jsonMap = json.decode(jsonString);
        var user = User.fromJson(jsonMap['data']);
        print(user.name);
        return user;
      }else{
        return null;
      }
  }

  Future<bool> loginUser(String mobile,String password) async {
    var response = await http.post("http://shortstay.pk/shortstay/api/login",
        body: jsonEncode({
          "mobile": mobile,
          "password":password,
        }),
        headers: {
          "content-type": "application/json"
        }
    );
    if(response.statusCode == 200){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var jsonString = response.body;
      print(response.body);
      var jsonMap = json.decode(jsonString);
      print(jsonMap['data']['id']);
      prefs.setBool("Session", true);
      prefs.setInt("userId", jsonMap['data']['id']);
      prefs.setString("full_name", jsonMap['data']['name']);
      prefs.setString("mobile", jsonMap['data']['mobile']);
      prefs.setString("email", jsonMap['data']['email']);
      prefs.setString("username", jsonMap['data']['username']);
      prefs.setString("address", jsonMap['data']['address']);
      return jsonMap['status'];
    }else{
      return false;
    }
  }

  Future<bool> sendOtp(String mobile) async {
    print(mobile);
    var response = await client.post('http://www.shortstay.pk/shortstay/api/send-otp',
        body: jsonEncode({
          'mobile':mobile
        }),
      headers: {
        "content-type": "application/json"
      }
    );
    print(response.body);
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
     return jsonMap['status'];
    }else{
      return false;
    }
  }

  Future<bool> updateUser(User user) async {
    var response = await http.post("http://shortstay.pk/shortstay/api/update-user",
        body: jsonEncode({
          "id": user.id,
          "name": user.name,
          "username": user.username,
          "email": user.email,
          "address": user.address,
          "cnic": user.cnic,
          "dob": user.dob,
        }),
        headers: {
          "content-type": "application/json"
        }
    );
    if(response.statusCode == 200){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var jsonString = response.body;
      print(response.body);
      var jsonMap = json.decode(jsonString);
      print(jsonMap['data']['id']);
      prefs.setString("full_name", jsonMap['data']['name']);
      prefs.setString("email", jsonMap['data']['email']);
      prefs.setString("username", jsonMap['data']['username']);
      prefs.setString("address", jsonMap['data']['address']);
      prefs.setString("cnic", jsonMap['data']['cnic']);
      prefs.setString("dob", jsonMap['data']['dob']);
      return jsonMap['status'];
    }else{
      return false;
    }
  }

  Future<bool> verifyOtp(String mobile,String pin) async {
    print(mobile);
    var response = await client.post('http://www.shortstay.pk/shortstay/api/verify-otp',
        body: jsonEncode({
          'mobile':mobile,
          'pin':pin
        }),
        headers: {
          "content-type": "application/json"
        }
    );
    print('zain');
    print(response.body);
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      return jsonMap['status'];
    }else{
      return false;
    }
  }

  Future<bool> roomBooking(BookingDetail bookingDetail,HotelDetails hotelDetails,RoomsDetails roomsDetails) async {

    var response = await client.post('http://www.shortstay.pk/shortstay/api/room-booking',
        body: jsonEncode({
        'room_id': roomsDetails.id,
        'check_in': bookingDetail.checkIn,
        'check_out':bookingDetail.checkOut,
        'user_id':bookingDetail.userId,
        'unique_prefix':hotelDetails.unique_prefix,
        'payment_type':'visa',
        'price':roomsDetails.price,
        'discount': 0.00,
        }),
        headers: {
          "content-type": "application/json"
        }
    );
    print('zain');
    print(response.body);
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      return jsonMap['status'];
    }else{
      return false;
    }
  }

  Future<Bookings> getBookings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getInt("userId").toString();
    print(userId);
    var response = await client.post('http://www.shortstay.pk/shortstay/api/get-booking',
        body: jsonEncode({
          'id':userId
        }),
        headers: {
          "content-type": "application/json"
        }
    );
    print(response.body);
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      var bookings = Bookings.fromJson(jsonMap);
      return bookings;
    }else{
      return null;
    }
  }

  Future<bool> updatePassword(String oldPassword,String newPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getInt("userId").toString();
    print(userId);
    var response = await client.post('http://www.shortstay.pk/shortstay/api/update-password',
        body: jsonEncode({
          'id':userId,
          'old_pass':oldPassword,
          'new_pass':newPassword
        }),
        headers: {
          "content-type": "application/json"
        }
    );
    print(response.body);
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      return jsonMap['status'];
    }else{
      return false;
    }
  }

  Future<bool> addToFavourite(String unique_prefix,int userId,String flag) async {
    print(userId);
    var response = await client.post('http://www.shortstay.pk/shortstay/api/add-favourite',
        body: jsonEncode({
          'user_id':userId,
          'unique_prefix':unique_prefix,
          'flag':flag
        }),
        headers: {
          "content-type": "application/json"
        }
    );
    print(response.body);
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      return jsonMap['status'];
    }else{
      return false;
    }
  }

  Future<Hotel> getFavourite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt("userId");
    var response = await client.get('http://www.shortstay.pk/shortstay/api/get-favourite/'+userId.toString());
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      print(jsonMap);
      var hotels = Hotel.fromJson(jsonMap);
      return hotels;
    }else{
      return null;
    }
  }
}