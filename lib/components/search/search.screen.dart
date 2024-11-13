import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mentor/navigation/router.dart';
import 'package:mentor/shared/utils/extensions.dart';

import 'data/filter.data.dart';
import 'model/popular_search.dart';
import 'widgets/search_result.widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  late FocusNode focusNode = FocusNode();
  List<PopularSearch> popularList = [
    PopularSearch(id: 1, totalResult: 980, title: "Figma"),
    PopularSearch(id: 2, totalResult: 489, title: "Webflow"),
    PopularSearch(id: 3, totalResult: 567, title: "Graffiti")
  ];

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                TextField(
                  focusNode: focusNode,
                  controller: searchController,
                  onChanged: (val) => {setState(() {})},
                  decoration: InputDecoration(
                    filled: focusNode.hasFocus,
                    fillColor: focusNode.hasFocus
                        ? Theme.of(context).colorScheme.onPrimary
                        : null,
                    prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
                    suffixIcon: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.outline)),
                        ),
                        child: RotatedBox(
                            quarterTurns: 1,
                            child: IconButton(
                                onPressed: () =>
                                    {context.push(AppRoutes.filter)},
                                icon: const Icon(FontAwesomeIcons.sliders)))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary)),
                    isDense: true,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    hintText: 'Enter a search term',
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                  children: [
                    if (searchController.text == "") ...[
                      const SizedBox(height: 32),
                      renderPopularList(context),
                      const SizedBox(height: 23),
                      renderCategories(),
                    ] else ...[
                      const SizedBox(height: 24),
                      SearchResult(keyword: searchController.text)
                    ]
                  ],
                )))
              ],
            )));
  }

  Widget renderPopularList(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Popular Searchs", style: context.titleMedium),
      const SizedBox(height: 16),
      ...popularList
          .map((item) => ListTile(
                tileColor: Colors.transparent,
                dense: true,
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                minLeadingWidth: 10,
                contentPadding: const EdgeInsets.all(0),
                trailing: IconButton(
                  icon: Icon(
                    Icons.clear,
                    size: 18,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  onPressed: () {},
                ),
                title: Row(children: [
                  Text(item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.titleSmall),
                  const SizedBox(width: 5),
                  Text("(${item.totalResult} searches)",
                      maxLines: 1, style: context.bodySmall)
                ]),
              ))
          
    ]);
  }

  Widget renderCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Browse Categories", style: context.titleMedium),
        const SizedBox(height: 16),
        ...categories
            .map((item) => ListTile(
                  tileColor: Colors.transparent,
                  dense: true,
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  minLeadingWidth: 10,
                  contentPadding: const EdgeInsets.all(0),
                  leading: Icon(item.icon,
                      color: Theme.of(context).colorScheme.onSurface),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    onPressed: () {},
                  ),
                  title: Text(item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.titleSmall),
                ))
            
      ],
    );
  }
}
