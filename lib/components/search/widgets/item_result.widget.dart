import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mentor/shared/shared.dart';

import '../model/item_search_result.dart';

class ItemResult extends StatelessWidget {
  const ItemResult({super.key, required this.item});
  final ItemSearchResult item;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.08),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star_outline_rounded,
                          size: 25,
                          color: Theme.of(context).colorScheme.outline),
                      const SizedBox(width: 10),
                      Text(
                        item.rating.toString(),
                        style: context.headlineMedium,
                      )
                    ],
                  ),
                  Text(
                    "${item.reviewers} reviewers / ${item.sessions} sessions",
                    style: context.bodySmall,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          item.price == 0
                              ? "Free"
                              : "\$${item.price} / ${item.unit!.name}",
                          style: context.labelMedium!
                              .copyWith(color: context.colors.primary)),
                      const SizedBox(width: 5),
                      Icon(Icons.credit_card,
                          color: Theme.of(context).colorScheme.outline)
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(item.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: context.titleMedium),
          Text(item.role ?? "", style: context.bodyMedium),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.inbox_outlined, size: 18),
              const SizedBox(width: 5),
              TextButton(
                onPressed: () {
                  //TODO: Go to inbox ${item.mentorId}
                },
                child: Text("Send Message", style: context.bodySmall),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.fact_check, size: 18),
              const SizedBox(width: 5),
              Expanded(
                  child: Text(
                      "Next available - ${DateFormat('MM/dd/yyyy hh:mm a').format(item.nextAvailable)}",
                      style: context.bodySmall))
            ],
          ),
          const SizedBox(height: 5),
          Divider(height: 1, color: Theme.of(context).colorScheme.outline),
          const SizedBox(height: 5),
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: item.skills
                .map((skill) => Text(
                      skill,
                      style: context.bodyMedium!.copyWith(
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.dashed),
                    ))
                .toList(),
          ),
        ]));
  }
}
