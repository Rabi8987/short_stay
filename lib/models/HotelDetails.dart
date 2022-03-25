import 'dart:convert';

class HotelDetails{
  String hotel_name;
  String hotel_descriptions;
  int total_rooms;
  int available_rooms;
  double latitude;
  double longitude;
  List<dynamic> amenities;
  List<dynamic> hotel_images;
  String rating;
  String unique_prefix;
  String distance;
  String minprice;

  HotelDetails({
    this.hotel_name,
    this.hotel_descriptions,
    this.total_rooms,
    this.available_rooms,
    this.latitude,
    this.longitude,
    this.amenities,
    this.hotel_images,
    this.rating,
    this.unique_prefix,
    this.minprice,
    this.distance
  });

  factory HotelDetails.fromJson(Map<String, dynamic> json) => HotelDetails(
      hotel_name:json["hotel_name"],
      hotel_descriptions:json["hotel_descriptions"],
      total_rooms:json["total_rooms"],
      available_rooms:json["available_rooms"],
      latitude:json["latitude"],
      longitude:json["longitude"],
      amenities:json["amenities"],
      hotel_images:json["hotel_images"],
      rating:json["rating"],
      unique_prefix:json["unique_prefix"],
      minprice:json["minprice"],
      distance:json["distance"]

  );

  Map<String, dynamic> toJson() => {
    "hotel_name":hotel_name,
    "hotel_descriptions":hotel_descriptions,
    "total_rooms":total_rooms,
    "available_rooms":available_rooms,
    "latitude":latitude,
    "longitude":longitude,
    "amenities":amenities,
    "hotel_images":hotel_images,
    "rating":rating,
    "unique_prefix":unique_prefix,
    "distance":distance,
    "minprice":minprice
  };
}