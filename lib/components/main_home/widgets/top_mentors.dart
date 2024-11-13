import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mentor/navigation/router.dart';
import 'package:mentor/shared/utils/extensions.dart';

import '../../../shared/models/mentor.model.dart';

class HomeTopMentors extends StatefulWidget {
  const HomeTopMentors({super.key, required this.mentors});
  final Iterable<MentorModel> mentors;
  @override
  State<HomeTopMentors> createState() => _HomeTopMentorsState();
}

class _HomeTopMentorsState extends State<HomeTopMentors> {
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
        GridView.builder(
          shrinkWrap: true,
          itemCount: widget.mentors.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 300.0),
          itemBuilder: (context, index) =>
              _customCard(context, widget.mentors.elementAt(index)),
        ),
      ],
    );
  }

  Widget _customCard(BuildContext context, MentorModel mentor) {
    return InkWell(
        onTap: () => context.push('${AppRoutes.profileMentor}/${mentor.id}'),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(mentor.avatarUrl),
                  ),
                ),
                _buildDetails(mentor)
              ]),
        ));
  }

  Widget _buildDetails(MentorModel mentor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          mentor.name,
          style: context.titleMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.start,
        ),
        Text(
          mentor.categories.map((e) => e.name).join(", "),
          style: context.bodyMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${mentor.numberOfMentoree} mentee",
          style: context.bodySmall,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.start,
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
    );
  }
}
