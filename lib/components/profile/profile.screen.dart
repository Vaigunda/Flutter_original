import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mentor/components/profile/providers/profile.provider.dart';
import '/shared/utils/extensions.dart';
import '../../navigation/router.dart';
import '../../shared/views/button.dart';
import 'models/profile.model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final MentorProfileModel profile = ProfileProvider.shared.getProfile();
  var isMentor = false; //switch to true to setting teaching schedule

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Profile",
          style: context.headlineMedium,
        ),
        actions: [
          IconButton(
              onPressed: () {
                context.push(AppRoutes.settings);
              },
              icon: const Icon(FontAwesomeIcons.gear))
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  _info(),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: _tiles(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _tiles() {
    return Column(
        // direction: Axis.vertical,
        // spacing: 16,
        children: [
          about(),
          const SizedBox(
            height: 10,
          ),
          workExperience(),
          const SizedBox(
            height: 10,
          ),
          buildTile(FontAwesomeIcons.graduationCap, "Education"),
          const SizedBox(
            height: 10,
          ),
          skills(),
          const SizedBox(
            height: 10,
          ),
          buildTile(FontAwesomeIcons.certificate, "Certificates"),
          const SizedBox(
            height: 10,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRoutes.settings);
              },
              child: buildTile(FontAwesomeIcons.gears, "Settings",
                  FontAwesomeIcons.arrowRight),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ]);
  }

  Widget _info() {
    return Center(
      child: Column(
        children: [
          const CircleAvatar(radius: 60),
          const SizedBox(
            height: 16,
          ),
          Text(
            profile.name,
            style: context.titleLarge,
          ),
          Text(
            profile.title,
            style: context.bodyMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isMentor)
                CustomButton(
                  label: "Setting schedule",
                  onPressed: () {
                    context.push(AppRoutes.settingTeachingSchedule);
                  },
                )
              else
                CustomButton(
                  label: "Become Mentor",
                  onPressed: () {
                    context.push('${AppRoutes.becomeMentor}/1');
                  },
                ),
              const SizedBox(
                width: 10,
              ),
              CustomButton(
                label: "My schedule",
                onPressed: () {
                  context.go(AppRoutes.mySchedule);
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildTile(IconData leadingIcon, String title,
      [IconData? trallingIcon]) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).cardColor),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFF22D3EE)),
            height: 48,
            width: 48,
            child: Icon(
              leadingIcon,
              color: Theme.of(context).cardColor,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: context.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
            child: SizedBox(
              width: 26,
              height: 26,
              child: FloatingActionButton.small(
                heroTag: title,
                elevation: 1,
                backgroundColor: context.colors.primary,
                onPressed: () {},
                child: Icon(
                  trallingIcon ?? FontAwesomeIcons.plus,
                  size: 10,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget about() {
    return Container(
      //padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).cardColor),
      child: Column(children: [
        buildTile(
            FontAwesomeIcons.circleUser, "About", FontAwesomeIcons.pencil),
        devider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Text(
            profile.about,
            style: context.bodyMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
          ),
        )
      ]),
    );
  }

  Widget devider() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Divider(
        color: Theme.of(context).colorScheme.outline,
        height: 0.5,
        thickness: 0.5,
      ),
    );
  }

  Widget workExperience() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).cardColor),
      child: Column(children: [
        buildTile(FontAwesomeIcons.bagShopping, "Work experience"),
        devider(),
        ...profile.experiences.map((exp) => Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          exp.jobTitle,
                          style: context.titleSmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.pencil,
                        color: Theme.of(context).colorScheme.primary,
                        size: 16,
                      )
                    ],
                  ),
                  Text(
                    exp.company,
                    style: context.bodySmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                  Text(
                    exp.period,
                    style: context.bodySmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  )
                ],
              ),
            ))
      ]),
    );
  }

  Widget skills() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).cardColor),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        buildTile(
            FontAwesomeIcons.bagShopping, "Skills", FontAwesomeIcons.pencil),
        devider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: [...profile.skills.map(chip)],
          ),
        )
      ]),
    );
  }

  Chip chip(String text) {
    return Chip(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      label: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      labelStyle: context.bodySmall!.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
