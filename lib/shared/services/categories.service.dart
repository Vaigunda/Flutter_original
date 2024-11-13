// categories.service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mentor/shared/models/category.model.dart';

class CategoriesService {
  final String apiUrl = 'http://localhost:8080/api/mentors/categories'; // Replace with your actual API URL

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response and map it to CategoryModel objects
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => CategoryModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
