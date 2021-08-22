import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:short_stay/models/hotel.dart';

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
      var hotels = Hotel.fromJson(jsonMap);
      return hotels;
    }else{
      return null;
    }
  }
}