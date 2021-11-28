import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  int id;
  String name;
  String username;
  String mobile;
  String email;
  String address;
  String cnic;
  String dob;
  String password;

  User(
      {this.id,
      this.name,
      this.username,
      this.mobile,
      this.email,
      this.address,
      this.cnic,
      this.dob,
      this.password});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      mobile: json["mobile"],
      email: json["email"],
      address: json["address"],
      cnic: json["cnic"],
      dob: json["dob"],
      password: json["password"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "mobile": mobile,
        "email": email,
        "address": address,
        "cnic": cnic,
        "dob": dob,
        "password": password
      };
}
