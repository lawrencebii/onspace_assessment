import 'package:meta/meta.dart';
import 'dart:convert';

class User {
  DateTime createdAt;
  String name;
  String avatar;
  String street;
  DateTime updated;
  int userId;
  DateTime since;
  String picture;
  String hotel;
  String lat;
  String long;
  String id;

  User({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.street,
    required this.updated,
    required this.userId,
    required this.since,
    required this.picture,
    required this.hotel,
    required this.lat,
    required this.long,
    required this.id,
  });

  User copyWith({
    DateTime? createdAt,
    String? name,
    String? avatar,
    String? street,
    DateTime? updated,
    int? userId,
    DateTime? since,
    String? picture,
    String? hotel,
    String? lat,
    String? long,
    String? id,
  }) =>
      User(
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        street: street ?? this.street,
        updated: updated ?? this.updated,
        userId: userId ?? this.userId,
        since: since ?? this.since,
        picture: picture ?? this.picture,
        hotel: hotel ?? this.hotel,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        id: id ?? this.id,
      );

  factory User.fromJson(String str) =>
      User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        street: json["street"],
        updated: DateTime.parse(json["updated"]),
        userId: json["user_id"],
        since: DateTime.parse(json["since"]),
        picture: json["picture"],
        hotel: json["hotel"],
        lat: json["lat"],
        long: json["long"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "street": street,
        "updated": updated.toIso8601String(),
        "user_id": userId,
        "since": since.toIso8601String(),
        "picture": picture,
        "hotel": hotel,
        "lat": lat,
        "long": long,
        "id": id,
      };
}
