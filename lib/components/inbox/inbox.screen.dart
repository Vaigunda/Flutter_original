import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/conversation_cards.dart';
import '/shared/shared.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Inbox",
          style: context.headlineMedium,
        ),
        actions: [
          IconButton(
              onPressed: () => {}, icon: const Icon(FontAwesomeIcons.bars))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => {},
        child: const Padding(
            padding: EdgeInsets.only(left: 0, right: 0),
            child: ConversationCards(userId: "")),
      ),
    );
  }
}
