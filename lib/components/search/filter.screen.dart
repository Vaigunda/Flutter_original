import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentor/shared/shared.dart';

import '../../shared/views/button.dart';
import 'data/filter.data.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? sortType;
  double? rating;
  Map<int, bool?> categoryValues = {};
  Map<int, bool?> priceValues = {};
  Map<int, bool?> sessionBlockValues = {};
  Map<int, bool?> timeAvailableValues = {};
  Map<int, bool?> daysAvailableValues = {};
  Map<int, bool?> languagesAvailableValues = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: filterTab.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () => context.pop(),
                icon: Icon(Icons.close,
                    color: Theme.of(context).colorScheme.onSurface)),
            Text("Filter", style: context.titleMedium)
          ],
        ),
        Container(
          color: Colors.transparent,
          child: TabBar(
              indicator: ShapeDecoration(
                shape: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 3,
                      style: BorderStyle.solid),
                ),
              ),
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              controller: _tabController,
              labelColor: Theme.of(context).colorScheme.primary,
              labelStyle: context.labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
              unselectedLabelColor:
                  Theme.of(context).colorScheme.onSurfaceVariant,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                ...filterTab.map(
                  (item) => Tab(
                      child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(item["icon"]),
                      const SizedBox(width: 8),
                      Text(item["name"]),
                    ],
                  )),
                )
              ]),
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            renderSortData(),
            renderCategoryData(),
            renderPrice(),
            renderRatingData(),
            renderSessionBlocks(),
            renderTimeAvailable(),
            renderDaysAvailable(),
            renderLanguageAvailable(),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                    type: EButtonType.secondary,
                    onPressed: () {},
                    label: "Reset"),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomButton(onPressed: () {}, label: "Apply"),
              )
            ],
          ),
        )
      ],
    )));
  }

  Widget renderSortData() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in sortTypeList)
          ListTile(
            tileColor: Colors.transparent,
            title: Text(item,
                style: context.bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)),
            leading: Radio<String>(
              value: item,
              groupValue: sortType,
              onChanged: (String? value) {
                setState(() {
                  sortType = value;
                });
              },
            ),
          ),
      ],
    ));
  }

  Widget renderRatingData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in ratings)
          ListTile(
            tileColor: Colors.transparent,
            title: Text('$item+',
                style: context.bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)),
            leading: Radio<double>(
              value: item,
              groupValue: rating,
              onChanged: (double? value) {
                setState(() {
                  rating = value;
                });
              },
            ),
          ),
      ],
    );
  }

  Widget renderCategoryData() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in categories)
          ListTile(
              tileColor: Colors.transparent,
              title: Text(item.name,
                  style: context.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
              leading: Checkbox(
                value: categoryValues[item.id] ?? false,
                onChanged: (bool? value) {
                  setState(() {
                    categoryValues[item.id] = value;
                  });
                },
              )),
      ],
    ));
  }

  Widget renderPrice() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in prices)
          ListTile(
              tileColor: Colors.transparent,
              title: Text(item == 0 ? "Free" : "Paid",
                  style: context.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
              leading: Checkbox(
                value: priceValues[item] ?? false,
                onChanged: (bool? value) {
                  setState(() {
                    priceValues[item] = value;
                  });
                },
              )),
      ],
    ));
  }

  Widget renderSessionBlocks() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in sessionsBlock)
          ListTile(
              tileColor: Colors.transparent,
              title: Text(item["name"],
                  style: context.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
              leading: Checkbox(
                value: sessionBlockValues[item["id"]] ?? false,
                onChanged: (bool? value) {
                  setState(() {
                    sessionBlockValues[item["id"]] = value;
                  });
                },
              )),
      ],
    ));
  }

  Widget renderTimeAvailable() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in timeAvailable)
          ListTile(
              tileColor: Colors.transparent,
              title: Text(item["name"],
                  style: context.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
              leading: Checkbox(
                value: timeAvailableValues[item["id"]] ?? false,
                onChanged: (bool? value) {
                  setState(() {
                    timeAvailableValues[item["id"]] = value;
                  });
                },
              )),
      ],
    ));
  }

  Widget renderDaysAvailable() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in daysAvailable)
          ListTile(
              tileColor: Colors.transparent,
              title: Text(item["name"],
                  style: context.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
              leading: Checkbox(
                value: daysAvailableValues[item["id"]] ?? false,
                onChanged: (bool? value) {
                  setState(() {
                    daysAvailableValues[item["id"]] = value;
                  });
                },
              )),
      ],
    ));
  }

  Widget renderLanguageAvailable() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in languages)
          ListTile(
              tileColor: Colors.transparent,
              title: Text(item["name"],
                  style: context.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
              leading: Checkbox(
                value: languagesAvailableValues[item["id"]] ?? false,
                onChanged: (bool? value) {
                  setState(() {
                    languagesAvailableValues[item["id"]] = value;
                  });
                },
              )),
      ],
    ));
  }
}
