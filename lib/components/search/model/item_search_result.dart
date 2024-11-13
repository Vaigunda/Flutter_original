// To parse this JSON data, do
//
//     final ItemSearchResult = ItemSearchResultFromJson(jsonString);

import '../../../shared/enums/unit.enum.dart';

class ItemSearchResult {
  ItemSearchResult({
    required this.reviewers,
    required this.sessions,
    required this.price,
    required this.avatar,
    required this.rating,
    required this.name,
    required this.mentorId,
    required this.skills,
    required this.nextAvailable,
    this.role,
    this.unit,
  });

  final int reviewers;
  final int sessions;
  final DateTime nextAvailable;
  final double price;
  final String avatar;
  final double rating;
  final String name;
  final String? role;
  final String mentorId;
  final Unit? unit;
  final List<String> skills;

  ItemSearchResult copyWith({
    int? reviewers,
    int? sessions,
    DateTime? nextAvailable,
    double? price,
    String? avatar,
    double? rating,
    String? name,
    String? role,
    String? mentorId,
    List<String>? skills,
  }) =>
      ItemSearchResult(
        reviewers: reviewers ?? this.reviewers,
        sessions: sessions ?? this.sessions,
        nextAvailable: nextAvailable ?? this.nextAvailable,
        price: price ?? this.price,
        avatar: avatar ?? this.avatar,
        rating: rating ?? this.rating,
        name: name ?? this.name,
        role: role ?? this.role,
        mentorId: mentorId ?? this.mentorId,
        skills: skills ?? this.skills,
      );

  factory ItemSearchResult.fromJson(Map<String, dynamic> json) =>
      ItemSearchResult(
        reviewers: json["reviewers"],
        sessions: json["sessions"],
        price: json["price"]?.toDouble(),
        avatar: json["avatar"],
        rating: json["rating"]?.toDouble(),
        name: json["name"],
        role: json["role"],
        mentorId: json["mentorId"],
        unit: json["unit"],
        nextAvailable: json["nextAvailable"],
        skills: List<String>.from(json["skills"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "reviewers": reviewers,
        "sessions": sessions,
        "price": price,
        "avatar": avatar,
        "rating": rating,
        "name": name,
        "role": role,
        "mentorId": mentorId,
        "unit": unit,
        "nextAvailable": nextAvailable,
        "skills": List<String>.from(skills.map((x) => x)),
      };
}
