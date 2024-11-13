import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentor/shared/utils/extensions.dart';

import '../../../shared/models/mentor.model.dart';

class HomeTopRated extends StatefulWidget {
  const HomeTopRated({super.key, required this.mentors});
  final Iterable<MentorModel> mentors;
  @override
  State<HomeTopRated> createState() => _HomeTopRatedState();
}

class _HomeTopRatedState extends State<HomeTopRated> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text(
            "Top Rated",
            style: context.headlineSmall,
          )
        ]),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 16,
          direction: Axis.vertical,
          children: [for (final mentor in widget.mentors) _info(mentor)],
        )
      ],
    );
  }

  Widget _info(MentorModel mentor) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                mentor.avatarUrl,
                fit: BoxFit.cover,
                height: 88,
                width: 88,
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mentor.name,
                    style: context.titleMedium,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    mentor.categories.map((e) => e.name).join(", "),
                    style: context.bodySmall,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "${mentor.numberOfMentoree} mentee",
                    style: context.bodySmall,
                  ),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.star,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "${mentor.rate}",
                        style: context.bodySmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
