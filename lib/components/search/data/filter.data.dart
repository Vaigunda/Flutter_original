import 'package:flutter/material.dart';

import '../model/category_search.dart';

List<Map<String, dynamic>> filterTab = [
  {"icon": Icons.sort, "name": "Sort by"},
  {"icon": Icons.category_outlined, "name": "Category"},
  {"icon": Icons.price_change_outlined, "name": "Price"},
  {"icon": Icons.star_outline_rounded, "name": "Rating"},
  {"icon": Icons.av_timer, "name": "Sessions block"},
  {"icon": Icons.today_outlined, "name": "Time Available"},
  {"icon": Icons.date_range_outlined, "name": "Days Available"},
  {"icon": Icons.language, "name": "Language"},
];

List<String> sortTypeList = [
  "Popular mentor",
  "Nearest you",
  "Price: Low to high",
  "Price: High to low",
  "Rating: High to low"
];

List<CategorySearch> categories = [
  CategorySearch(id: 1, icon: Icons.design_services, name: "Design"),
  CategorySearch(id: 2, icon: Icons.developer_mode, name: "Development"),
  CategorySearch(
      id: 3, icon: Icons.account_balance, name: "Finance & Accounting "),
  CategorySearch(
      id: 4, icon: Icons.camera_alt_outlined, name: "Photograply & Video"),
  CategorySearch(
      id: 5, icon: Icons.fitness_center_outlined, name: "Health & Fitness"),
  CategorySearch(id: 6, icon: Icons.business_center_outlined, name: "Business"),
  CategorySearch(id: 7, icon: Icons.shopify_rounded, name: "Lifestyle")
];

List<int> prices = [0, 1];
List<double> ratings = [4.5, 4, 3.5, 3];
List<Map<String, dynamic>> sessionsBlock = [
  {"id": 1, "name": "60 min"},
  {"id": 2, "name": "30 min"},
  {"id": 3, "name": "14 min"},
  {"id": 4, "name": "Monthly coaching"},
];
List<Map<String, dynamic>> timeAvailable = [
  {"id": 1, "name": "12am - 2am"},
  {"id": 2, "name": "2am - 4am"},
  {"id": 3, "name": "4am - 6am"},
  {"id": 4, "name": "6am - 8am"},
  {"id": 5, "name": "8am - 10am"},
  {"id": 6, "name": "10am - 12pm"},
  {"id": 7, "name": "12pm - 2pm"},
  {"id": 8, "name": "2pm - 4pm"},
  {"id": 9, "name": "4pm - 6pm"},
  {"id": 10, "name": "6pm - 8pm"},
  {"id": 11, "name": "8pm - 10pm"},
  {"id": 12, "name": "10pm - 12am"},
];
List<Map<String, dynamic>> daysAvailable = [
  {"id": 1, "name": "Monday"},
  {"id": 2, "name": "Tuesday"},
  {"id": 3, "name": "Wednesday"},
  {"id": 4, "name": "Thursday"},
  {"id": 5, "name": "Friday"},
  {"id": 6, "name": "Saturday"},
  {"id": 7, "name": "Sunday"},
];
List<Map<String, dynamic>> languages = [
  {"id": 1, "name": "English"},
  {"id": 2, "name": "French"},
  {"id": 3, "name": "Spanish"},
  {"id": 4, "name": "Dutch"},
  {"id": 5, "name": "Russian"},
  {"id": 6, "name": "German"},
  {"id": 7, "name": "Italian"},
];
