import 'package:flutter/material.dart';
import 'package:mentor/components/search/model/item_search_result.dart';
import 'package:mentor/shared/utils/extensions.dart';

import '../../../shared/enums/unit.enum.dart';
import 'item_result.widget.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key, this.keyword});
  final String? keyword;

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  int total = 23;
  List<ItemSearchResult> result = [
    ItemSearchResult(
        reviewers: 245,
        sessions: 123,
        price: 0,
        avatar: '',
        rating: 4.99,
        name: "Foti Panagiotakopulos",
        role: "Founder @ GrowthMentor",
        mentorId: "uuid",
        nextAvailable: DateTime.now(),
        unit: Unit.hour,
        skills: [
          "Designer",
          "Development Web",
          "Mobile App",
          "Trading",
          "AI - Machine learning",
          "Marketing",
          "Content Creator"
        ]),
    ItemSearchResult(
        reviewers: 245,
        sessions: 123,
        price: 12,
        avatar: '',
        rating: 4.99,
        nextAvailable: DateTime.now(),
        name: "Foti Panagiotakopulos",
        role: "Founder @ GrowthMentor",
        mentorId: "uuid",
        unit: Unit.hour,
        skills: [
          "Designer",
          "Development Web",
          "Mobile App",
          "Trading",
          "AI - Machine learning",
          "Marketing",
          "Content Creator"
        ])
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Result's for ",
                  style: context.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
              TextSpan(
                  text: "“${widget.keyword ?? ''}”",
                  style: context.labelLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary))
            ])),
            Text("$total found",
                style: context.labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary))
          ],
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 10,
          children: [...result.map((item) => ItemResult(item: item))],
        )
      ],
    );
  }
}
