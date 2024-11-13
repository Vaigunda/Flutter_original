import 'package:flutter/material.dart';
import 'package:mentor/shared/models/category.model.dart';
import 'package:mentor/shared/providers/categories.provider.dart';
import 'package:mentor/shared/utils/extensions.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text(
            "Categories",
            style: context.headlineSmall,
          )
        ]),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 10,
            children: [
              for (final cat in CategoriesProvider.shared.categories)
                _chip(cat, context)
              // Chip(
              //   autofocus: true,
              //   label: Text(
              //     "Design",
              //     style: context.titleSmall,
              //   ),
              //   avatar: const Icon(Icons.design_services_outlined),
              // ),
              // Chip(
              //   label: Text(
              //     "Development",
              //     style: context.titleSmall,
              //   ),
              //   avatar: const Icon(Icons.developer_board_rounded),
              // ),
              // Chip(
              //   label: Text(
              //     "English",
              //     style: context.titleSmall,
              //   ),
              //   avatar: const Icon(Icons.table_chart),
              // ),
              // Chip(
              //   label: Text(
              //     "Photography",
              //     style: context.titleSmall,
              //   ),
              //   avatar: const Icon(Icons.photo_camera_outlined),
              // ),
              // Chip(
              //   label: Text(
              //     "Business",
              //     style: context.titleSmall,
              //   ),
              //   // ignore: prefer_const_constructors
              //   avatar: Icon(Icons.business),
              // )
            ],
          ),
        )
      ],
    );
  }

  Widget _chip(CategoryModel cat, BuildContext context) {
    return Chip(
      autofocus: true,
      label: Text(
        cat.name,
        style: context.titleSmall,
      ),
      avatar: Icon(cat.icon),
    );
  }
}


// undo this
// categories.dart
// import 'package:flutter/material.dart';
// import 'package:mentor/shared/models/category.model.dart';
// import 'package:mentor/shared/services/categories.service.dart';
// import 'package:mentor/shared/utils/extensions.dart';

// class HomeCategories extends StatefulWidget {
//   const HomeCategories({super.key});

//   @override
//   State<HomeCategories> createState() => _HomeCategoriesState();
// }

// class _HomeCategoriesState extends State<HomeCategories> {
//   late Future<List<CategoryModel>> categoriesFuture;

//   @override
//   void initState() {
//     super.initState();
//     categoriesFuture = CategoriesService().fetchCategories(); // Fetch categories on widget init
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Text(
//               "Categories",
//               style: context.headlineSmall,
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         FutureBuilder<List<CategoryModel>>(
//           future: categoriesFuture, // Use the fetched data
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }

//             if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             }

//             if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return const Center(child: Text('No categories available'));
//             }

//             // Display categories in horizontal scrollable list
//             return SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Wrap(
//                 spacing: 10,
//                 children: snapshot.data!
//                     .map((cat) => _chip(cat, context))
//                     .toList(),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }

//   Widget _chip(CategoryModel cat, BuildContext context) {
//     return Chip(
//       autofocus: true,
//       label: Text(
//         cat.name,
//         style: context.titleSmall,
//       ),
//       avatar: Icon(cat.getIcon()), // Use the getIcon() method
//     );
//   }
// }
