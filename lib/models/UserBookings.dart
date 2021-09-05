import 'dart:convert';

class UserBookings{
  UserBookings({
    this.upcoming,
    this.history,
  });


  factory UserBookings.fromJson(Map<String, dynamic> json) => UserBookings(
    upcoming: json["upcoming"],
    history: json["history"],
  );

  Map<String, dynamic> toJson() => {
    "upcoming":upcoming,
    "history":history,
  };

  List<dynamic> upcoming;
  List<dynamic> history;
}