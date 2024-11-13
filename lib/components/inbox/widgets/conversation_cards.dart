import 'package:flutter/material.dart';
import 'package:mentor/components/inbox/providers/messages.provider.dart';
import '../conversation_messages.screen.dart';
import '../models/conversation.model.dart';
import '/shared/shared.dart';
import 'package:timeago/timeago.dart' as timeago;

class ConversationCards extends StatefulWidget {
  final String userId;
  const ConversationCards({super.key, required this.userId});

  @override
  State<ConversationCards> createState() => _ConversationCardsState();
}

class _ConversationCardsState extends State<ConversationCards> {
  _ConversationCardsState();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).dialogBackgroundColor),
      child: _chat(),
    );
  }

  Widget _chat() {
    var chats = MessageProvider.shared.getNewConversation(widget.userId);
    return ListView.separated(
      itemBuilder: (context, position) {
        var chat = chats[position];
        return _chatTile(chat);
      },
      separatorBuilder: (context, index) {
        return Divider(
          thickness: 1,
          color: Theme.of(context).dividerColor,
        );
      },
      padding: const EdgeInsets.all(0),
      itemCount: chats.length,
    );
  }

  Widget _chatTile(ConversationModel chat) {
    final hasUnread = chat.unreadCount > 0;
    return ListTile(
        style: ListTileStyle.list,
        contentPadding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
        minVerticalPadding: 0.0,
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.sender,
                    style: hasUnread
                        ? context.titleSmall!
                            .copyWith(fontWeight: FontWeight.bold)
                        : context.titleSmall,
                  ),
                  Text(
                    chat.lastMessage,
                    style: hasUnread
                        ? context.bodySmall!
                            .copyWith(fontWeight: FontWeight.bold)
                        : context.bodySmall,
                  )
                ],
              )),
              Column(
                children: [
                  Text(
                    timeago.format(chat.lastSent, locale: 'en_short'),
                    style: context.bodySmall,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  if (hasUnread)
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary),
                      width: 20.0,
                      height: 20.0,
                      child: Center(
                        child: Text(
                          chat.unreadCount.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ),
                    ),
                ],
              ),
            ]),
        leading: Transform.translate(
            offset: const Offset(6, 0),
            child: userAvatar(context, chat.avatar, chat.online)),
        //trailing: const Icon(FontAwesomeIcons.anchor),
        onTap: () => setState(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return ConversationMessagesScreen(
                    userId: widget.userId,
                    senderId: chat.sender,
                    senderName: chat.sender,
                    avatar: chat.avatar,
                    online: chat.online);
              }));
            }));
  }
}
