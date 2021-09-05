import 'dart:convert';


class RoomsDetails{
  int id;
  String category;
  String status;
  String capacity;
  String animites;
  String image;
  int price;

  RoomsDetails({
    this.id,
    this.category,
    this.status,
    this.capacity,
    this.image,
    this.animites,
    this.price
  });

  factory RoomsDetails.fromJson(Map<String, dynamic> json) => RoomsDetails(
      id:json["id"],
      category:json["category"],
      status:json["status"],
      capacity:json["capacity"],
      image:json["image"],
      animites: json["animites"],
      price: json["price"],

  );

  Map<String, dynamic> toJson() => {
    "id":id,
    "category":category,
    "status":status,
    "capacity":capacity,
    "image":image,
    "animites": animites,
    "price":price
  };
}