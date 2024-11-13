import 'package:flutter/material.dart';

class ConversationModel {
  final String sender;
  final String avatar;
  final int unreadCount;
  final String lastMessage;
  final DateTime lastSent;
  final bool online;

  ConversationModel(
      {required this.sender,
      required this.avatar,
      required this.lastMessage,
      required this.lastSent,
      required this.unreadCount,
      required this.online});
}

class FileModel {
  final String path;
  final String contentType;

  FileModel({required this.path, required this.contentType});
}

class MessageModel {
  final String sender;
  final MessageType type;
  final String content;
  final List<FileModel>? files;
  final bool isMe;

  MessageModel(
      {required this.sender,
      required this.type,
      required this.files,
      required this.content,
      required this.isMe});
}

enum MessageType { text, photos, attachment }

Widget userAvatar(BuildContext context, String avatar, bool online,
    {double radius = 40.0, double onlineRadius = 10.0, double right = 10.0}) {
  return Stack(
    children: [
      CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(avatar),
      ),
      Positioned(
          right: right,
          top: 0.0,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Theme.of(context).dialogBackgroundColor,
                shape: BoxShape.circle),
            width: onlineRadius + 4.0,
            height: 14.0,
            child: Container(
              width: onlineRadius,
              height: onlineRadius,
              decoration: BoxDecoration(
                  color: online
                      ? Theme.of(context).primaryColorDark
                      : Theme.of(context).disabledColor,
                  shape: BoxShape.circle),
            ),
          ))
    ],
  );
}
