import 'package:flutter/material.dart';

class CategorySearch {
  CategorySearch({
    required this.id,
    required this.icon,
    required this.name,
  });

  final int id;
  final IconData icon;
  final String name;

  CategorySearch copyWith({
    int? id,
    IconData? icon,
    String? name,
  }) =>
      CategorySearch(
        id: id ?? this.id,
        icon: icon ?? this.icon,
        name: name ?? this.name,
      );

  factory CategorySearch.fromJson(Map<String, dynamic> json) => CategorySearch(
        id: json["id"],
        icon: json["icon"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "name": name,
      };
}
