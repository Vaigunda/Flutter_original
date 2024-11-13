import 'package:collection/collection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentor/shared/models/category.model.dart';

class CategoriesProvider {
  static CategoriesProvider get shared => CategoriesProvider();
  List<CategoryModel> get categories => [
        CategoryModel(
            id: "1", name: "Development", icon: FontAwesomeIcons.code),
        CategoryModel(id: "2", name: "Design", icon: FontAwesomeIcons.penNib),
        CategoryModel(
            id: "3", name: "English", icon: FontAwesomeIcons.language),
        CategoryModel(
            id: "4", name: "Photography", icon: FontAwesomeIcons.photoFilm),
        CategoryModel(
            id: "5", name: "Business", icon: FontAwesomeIcons.businessTime),
        CategoryModel(id: "6", name: "Math", icon: FontAwesomeIcons.calculator),
        CategoryModel(id: "7", name: "Content", icon: FontAwesomeIcons.blog),
        CategoryModel(
            id: "8", name: "Marketing", icon: FontAwesomeIcons.wandSparkles),
      ];

  CategoryModel? getCategory(String id) {
    return categories.firstWhereOrNull((x) => x.id == id);
  }
}


// undo this
// import 'package:collection/collection.dart';
// import 'package:mentor/shared/models/category.model.dart';

// class CategoriesProvider {
//   static CategoriesProvider get shared => CategoriesProvider();
  
//   List<CategoryModel> get categories => [
//         CategoryModel(id: "1", name: "Development", icon: "FontAwesomeIcons.code"),
//         CategoryModel(id: "2", name: "Design", icon: "FontAwesomeIcons.penNib"),
//         CategoryModel(id: "3", name: "English", icon: "FontAwesomeIcons.language"),
//         CategoryModel(id: "4", name: "Photography", icon: "FontAwesomeIcons.photoFilm"),
//         CategoryModel(id: "5", name: "Business", icon: "FontAwesomeIcons.businessTime"),
//         CategoryModel(id: "6", name: "Math", icon: "FontAwesomeIcons.calculator"),
//         CategoryModel(id: "7", name: "Content", icon: "FontAwesomeIcons.blog"),
//         CategoryModel(id: "8", name: "Marketing", icon: "FontAwesomeIcons.wandSparkles"),
//       ];

//   CategoryModel? getCategory(String id) {
//     return categories.firstWhereOrNull((x) => x.id == id);
//   }
// }

// import 'package:collection/collection.dart';
// import 'package:mentor/shared/models/category.model.dart';

// class CategoriesProvider {
//   static CategoriesProvider get shared => CategoriesProvider();

//   List<CategoryModel> get categories => [
//         CategoryModel(id: "1", name: "Development", icon: "code"),
//         CategoryModel(id: "2", name: "Design", icon: "penNib"),
//         CategoryModel(id: "3", name: "English", icon: "language"),
//         CategoryModel(id: "4", name: "Photography", icon: "photoFilm"),
//         CategoryModel(id: "5", name: "Business", icon: "businessTime"),
//         CategoryModel(id: "6", name: "Math", icon: "calculator"),
//         CategoryModel(id: "7", name: "Content", icon: "blog"),
//         CategoryModel(id: "8", name: "Marketing", icon: "wandSparkles"),
//       ];

//   CategoryModel? getCategory(String id) {
//     return categories.firstWhereOrNull((x) => x.id == id);
//   }
// }

