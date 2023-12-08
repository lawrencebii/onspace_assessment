import 'dart:convert';

class RecentModel {
  DateTime createdAt;
  String location;
  DateTime recent;
  String id;

  RecentModel({
    required this.createdAt,
    required this.location,
    required this.recent,
    required this.id,
  });

  RecentModel copyWith({
    DateTime? createdAt,
    String? location,
    DateTime? recent,
    String? id,
  }) =>
      RecentModel(
        createdAt: createdAt ?? this.createdAt,
        location: location ?? this.location,
        recent: recent ?? this.recent,
        id: id ?? this.id,
      );

  factory RecentModel.fromJson(String str) =>
      RecentModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecentModel.fromMap(Map<String, dynamic> json) => RecentModel(
        createdAt: DateTime.parse(json["createdAt"]),
        location: json["location"],
        recent: DateTime.parse(json["recent"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "createdAt": createdAt.toIso8601String(),
        "location": location,
        "recent": recent.toIso8601String(),
        "id": id,
      };
}
