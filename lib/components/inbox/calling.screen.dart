import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentor/shared/shared.dart';

class CallingScreen extends StatefulWidget {
  final String senderId;
  final String senderName;
  final String avatar;
  final bool online;
  final bool videoCall;
  const CallingScreen(
      {super.key,
      required this.senderId,
      required this.senderName,
      required this.avatar,
      required this.online,
      required this.videoCall});

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: const []),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(widget.avatar),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      widget.senderName,
                      style: context.titleLarge,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: const Text("04:38 minutes"),
                  )
                ],
              )),
          Container(
            padding: const EdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).colorScheme.onSecondary,
                            spreadRadius: 3),
                      ],
                    ),
                    child: IconButton(
                        onPressed: () => {},
                        icon: Icon(
                          FontAwesomeIcons.microphoneSlash,
                          color: Theme.of(context).colorScheme.primary,
                        ))),
                Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).colorScheme.surfaceTint,
                            spreadRadius: 20),
                      ],
                    ),
                    child: IconButton(
                        onPressed: () => {},
                        icon: Icon(
                          size: 30,
                          FontAwesomeIcons.phoneSlash,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ))),
                Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).colorScheme.onSecondary,
                            spreadRadius: 3),
                      ],
                    ),
                    child: IconButton(
                        onPressed: () => {},
                        icon: Icon(
                          FontAwesomeIcons.videoSlash,
                          color: Theme.of(context).colorScheme.primary,
                        ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
