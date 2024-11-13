import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calling.screen.dart';
import 'providers/messages.provider.dart';
import '/shared/shared.dart';
import 'models/conversation.model.dart';

class ConversationMessagesScreen extends StatefulWidget {
  final String userId;
  final String senderId;
  final String senderName;
  final String avatar;
  final bool online;
  const ConversationMessagesScreen(
      {super.key,
      required this.userId,
      required this.senderId,
      required this.senderName,
      required this.avatar,
      required this.online});

  @override
  State<ConversationMessagesScreen> createState() =>
      _ConversationMessagesScreenState();
}

class _ConversationMessagesScreenState
    extends State<ConversationMessagesScreen> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.chevronLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(children: [
          userAvatar(context, widget.avatar, widget.online,
              radius: 26.0, onlineRadius: 7.0, right: 5.0),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.senderName,
                style: context.titleMedium,
              ),
              Text(
                widget.online ? "Active now" : "Inactive",
                style: context.bodySmall,
              )
            ],
          )
        ]),
        actions: [
          IconButton(
              onPressed: () => {callFriend(false)},
              icon: Icon(
                FontAwesomeIcons.phone,
                color: context.colors.onSurfaceVariant,
              )),
          IconButton(
              onPressed: () => {callFriend(true)},
              icon: Icon(
                FontAwesomeIcons.video,
                color: context.colors.onSurfaceVariant,
              )),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => {},
              child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: _messages()),
            ),
          ),
          _msgInput()
        ],
      ),
    );
  }

  Widget _messages() {
    List<MessageModel> messages =
        MessageProvider.shared.getMessages(widget.userId, widget.senderId);

    return ListView.builder(
      itemBuilder: (context, position) {
        // if (position == messages.length) {
        //   return _msgInput();
        // }
        var msg = messages[position];
        return _msgTile(msg);
      },
      padding: const EdgeInsets.all(0),
      itemCount: messages.length,
    );
  }

  Widget _msgInput() {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.cardColor,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              FontAwesomeIcons.paperclip,
              size: 20,
            ),
          ),
          Expanded(
              child: TextField(
            controller: _textController,
            keyboardType: TextInputType.multiline,
            style: context.titleSmall,
            decoration: const InputDecoration(
                border: null, hintText: "Type message..."),
          )),
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                FontAwesomeIcons.paperPlane,
                size: 20,
              ))
        ],
      ),
    );
  }

  Widget _msgTile(MessageModel msg) {
    switch (msg.type) {
      case MessageType.text:
        return msg.isMe ? _myMessage(msg) : _friendMessage(msg);

      case MessageType.photos:
      case MessageType.attachment:
        // if (msg.files != null && msg.files!.isNotEmpty) {
        //   return msg.isMe ? _myPhotoMessage(msg) : _friendPhotoMessage(msg);
        // }
        return Container();
    }
  }

  Widget _time(String time) {
    return Text(
      time,
      style: context.bodySmall,
    );
  }

  Widget _friendMessage(MessageModel msg) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("assets/images/avatar-2.png"),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: context.theme.cardColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    msg.content,
                    style: context.titleSmall!
                        .copyWith(fontWeight: FontWeight.normal, fontSize: 12),
                    softWrap: true,
                  ),
                  Text(
                    "10:30 AM",
                    style: context.bodySmall!.copyWith(fontSize: 10),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _myMessage(MessageModel msg) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    msg.content,
                    style: context.titleSmall!.copyWith(
                        color: context.colors.onTertiary, fontSize: 12),
                  ),
                  Text(
                    "10:30 AM",
                    style: context.bodySmall!.copyWith(
                        color: context.colors.onPrimaryContainer, fontSize: 10),
                  )
                ],
              ),
            ),
          ),
          CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage(widget.avatar),
          ),
        ],
      ),
    );
  }

  Widget _img(FileModel f) {
    switch (f.contentType) {
      case "image/jpg":
      case "image/png":
      case "image/gif":
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                f.path,
                fit: BoxFit.cover,
                height: 100,
                width: 120,
              ),
            )
          ],
        );
    }
    // attachment file
    return Container();
  }

  //Not support yet
  Widget _myPhotoMessage(MessageModel msg) {
    return ListTile(
      leading: _time("10:20 AM"),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [...msg.files!.map(_img)],
      ),
    );
  }

  Widget _friendPhotoMessage(MessageModel msg) {
    return ListTile(
      leading: Transform.translate(
          offset: const Offset(0, -15),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(widget.avatar),
          )),
      trailing: _time("10:20 AM"),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [...msg.files!.map(_img)],
      ),
    );
  }

  void callFriend(bool isVideo) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return CallingScreen(
          senderId: widget.senderId,
          senderName: widget.senderName,
          avatar: widget.avatar,
          online: widget.online,
          videoCall: isVideo);
    }));
  }
}
