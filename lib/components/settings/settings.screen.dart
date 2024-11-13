import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentor/shared/shared.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _switch = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Settings",
      )),
      body: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: MainAxisAlignment.s,
                // mainAxisSize: MainAxisSize.min,
                children: [
              const SizedBox(
                height: 30,
              ),
              generalSettings(),
              const SizedBox(
                height: 20,
              ),
              terms()
            ])),
      ),
    );
  }

  Widget generalSettings() {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "General settings",
            style: context.titleMedium,
          ),
        ),
        buildTile(
          FontAwesomeIcons.bell,
          "Notifications",
          Switch(
            value: _switch,
            onChanged: (bool value) {
              setState(() {
                _switch = value;
              });
            },
          ),
        ),
        const Divider(
          height: 1,
          thickness: 0.5,
        ),
        buildTile(
          Icons.brightness_3,
          "Dark mode",
          Switch(
            value: _switch,
            onChanged: (bool value) {
              setState(() {
                _switch = value;
              });
            },
          ),
        ),
      ]),
    );
  }

  Widget terms() {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Terms and Support",
            style: context.titleMedium,
          ),
        ),
        buildTile(FontAwesomeIcons.shield, "Privacy",
            const Icon(FontAwesomeIcons.arrowRight)),
        const Divider(
          height: 1,
          thickness: 0.5,
        ),
        buildTile(FontAwesomeIcons.circleQuestion, "Support 24/7",
            const Icon(FontAwesomeIcons.arrowRight)),
        // buildTile(Icons.brightness_3, "Dark mode", false)
      ]),
    );
  }

  Widget buildTile(IconData leadingIcon, String title, [Widget? action]) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(color: Theme.of(context).cardColor),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFF22D3EE)),
            height: 36,
            width: 36,
            child: Icon(
              size: 16,
              leadingIcon,
              color: Theme.of(context).cardColor,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: context.titleSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0), child: action)
        ],
      ),
    );
  }
}
