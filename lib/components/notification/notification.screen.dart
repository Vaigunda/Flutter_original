import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentor/shared/providers/notifications.provider.dart';
import 'package:mentor/shared/shared.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notifications = NotificationsProvider.shared.notifications;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Notifications",
          style: context.headlineMedium,
        ),
        actions: [TextButton(onPressed: () {}, child: const Text("Clear all"))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Dismissible(
                background: Container(
                  decoration:
                      BoxDecoration(color: context.colors.errorContainer),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(FontAwesomeIcons.trashCan),
                        SizedBox(
                          width: 20,
                        )
                      ]),
                ),
                key: Key(notifications[index].id),
                child: ListTile(
                  title: Text(notification.title),
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notification.message ?? ""),
                        Text(
                          timeago.format(notification.dateTime),
                          style: context.bodySmall,
                        )
                      ]),
                  leading: CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage(
                      notification.initiatedUser.avatarUrl,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
