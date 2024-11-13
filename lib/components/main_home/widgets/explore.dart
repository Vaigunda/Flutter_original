import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mentor/navigation/router.dart';
import 'package:mentor/shared/shared.dart';
import '../../../shared/widgets/gradient_button.dart';

class ExploreMentor extends StatefulWidget {
  const ExploreMentor({super.key});

  @override
  State<ExploreMentor> createState() => _ExploreMentorState();
}

class _ExploreMentorState extends State<ExploreMentor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return mentor(context);
  }

  Stack mentor(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              headingLine(),
              Text(
                "Book and meet mentors for 1:1 mentorship in our global community",
                style: context.bodyLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GradientButton(
                    label: Text(
                      "Find your Mentor",
                      style: context.labelLarge!
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    onPressed: () {
                      context.go(AppRoutes.search);
                    },
                    trailingIcon: Icon(
                      FontAwesomeIcons.arrowRight,
                      color: Theme.of(context).cardColor,
                      size: 16,
                    ),
                  ),
                  //CustomButton(label: "Becom a Mentor", onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Positioned mentorPositioned(
      {double? radius,
      double? left,
      double? top,
      double? right,
      double? bottom,
      double opacity = 0}) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
      child: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: opacity,
        child: CircleAvatar(
          radius: radius ?? 40,
          backgroundImage: const AssetImage("assets/images/sample-1.jpg"),
        ),
      ),
    );
  }

  Widget headingLine() {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          'Learn and grow with help from world-class mentors',
          style: context.headlineLarge!.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1
                ..color = Colors.white),
        ),
        // Solid text as fill.
        Text(
          'Learn and grow with help from world-class mentors',
          style: context.headlineLarge,
        ),
      ],
    );
  }
}
