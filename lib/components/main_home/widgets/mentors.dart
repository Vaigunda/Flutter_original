import 'package:flutter/material.dart';
import 'package:mentor/shared/utils/extensions.dart';

import '../../../shared/models/mentor.model.dart';

class HomeMentors extends StatefulWidget {
  const HomeMentors({super.key, required this.mentors});
  final Iterable<MentorModel> mentors;
  @override
  State<HomeMentors> createState() => _HomeMentorsState();
}

class _HomeMentorsState extends State<HomeMentors> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text(
            "Top Mentors",
            style: context.headlineSmall,
          )
        ]),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 16,
            children: [for (final mentor in widget.mentors) _info(mentor)],
          ),
        )
      ],
    );
  }

  Widget _info(MentorModel mentor) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(mentor.avatarUrl),
        ),
        Positioned(
            bottom: 0,
            left: 16,
            child: Chip(
              backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
              label: Text(
                mentor.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              labelStyle: context.labelMedium,
            ))
      ],
    );
  }
}
