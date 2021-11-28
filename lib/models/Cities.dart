import 'dart:convert';

class Cities{
  String city;

  Cities({
    this.city
});
  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
    city: json['city']
  );

  Map<String, dynamic> toJson() =>
      {
        "city": city
      };
}