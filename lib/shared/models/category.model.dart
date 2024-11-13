import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final IconData icon;

  CategoryModel({required this.id, required this.name, required this.icon});
  
}


// undo this
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class CategoryModel {
//   final String id;
//   final String name;
//   final String icon;

//   CategoryModel({required this.id, required this.name, required this.icon});

//   // Factory constructor to create CategoryModel from JSON
//   factory CategoryModel.fromJson(Map<String, dynamic> json) {
//     return CategoryModel(
//       id: json['id'] as String,
//       name: json['name'] as String,
//       icon: json['icon'] as String, // Assuming icon is stored as a string in the API
//     );
//   }

//   // Method to convert icon string to IconData
//   IconData getIcon() {
//     switch (icon) {
//       case 'FontAwesomeIcons.code':
//         return FontAwesomeIcons.code;
//       case 'FontAwesomeIcons.penNib':
//         return FontAwesomeIcons.penNib;
//       case 'FontAwesomeIcons.language':
//         return FontAwesomeIcons.language;
//       case 'FontAwesomeIcons.photoFilm':
//         return FontAwesomeIcons.photoFilm;
//       case 'FontAwesomeIcons.businessTime':
//         return FontAwesomeIcons.businessTime;
//       case 'FontAwesomeIcons.calculator':
//         return FontAwesomeIcons.calculator;
//       case 'FontAwesomeIcons.blog':
//         return FontAwesomeIcons.blog;
//       case 'FontAwesomeIcons.wandSparkles':
//         return FontAwesomeIcons.wandSparkles;
//       default:
//         return FontAwesomeIcons.question; // Fallback icon if no match
//     }
//   }


// }

// category.model.dart
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/material.dart';

// class CategoryModel {
//   final String id;
//   final String name;
//   final String icon; // Store icon as a string

//   CategoryModel({required this.id, required this.name, required this.icon});

//   // Method to convert icon string to IconData
//   IconData getIcon() {
//     switch (icon) {
//       case 'code':
//         return FontAwesomeIcons.code;
//       case 'penNib':
//         return FontAwesomeIcons.penNib;
//       case 'language':
//         return FontAwesomeIcons.language;
//       case 'photoFilm':
//         return FontAwesomeIcons.photoFilm;
//       case 'businessTime':
//         return FontAwesomeIcons.businessTime;
//       case 'calculator':
//         return FontAwesomeIcons.calculator;
//       case 'blog':
//         return FontAwesomeIcons.blog;
//       case 'wandSparkles':
//         return FontAwesomeIcons.wandSparkles;
//       default:
//         return FontAwesomeIcons.question; // Fallback icon if no match
//     }
//   }
// }

