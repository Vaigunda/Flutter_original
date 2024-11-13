import '../models/conversation.model.dart';

class MessageProvider {
  static MessageProvider get shared => MessageProvider();

  List<ConversationModel> getNewConversation(String userId) {
    return List.from([
      ConversationModel(
          sender: "Saravanath",
          avatar: "assets/images/avatar-6.png",
          lastMessage: "Are you still there?",
          lastSent: DateTime.now(),
          unreadCount: 2,
          online: true),
      ConversationModel(
          sender: "Saravanath",
          avatar: "assets/images/avatar-7.png",
          lastMessage: "Are you still there?",
          lastSent: DateTime.now(),
          unreadCount: 0,
          online: false),
      ConversationModel(
          sender: "Saravanath",
          avatar: "assets/images/avatar-8.png",
          lastMessage: "Are you still there?",
          lastSent: DateTime.now(),
          unreadCount: 2,
          online: true),
      ConversationModel(
          sender: "Saravanath",
          avatar: "assets/images/avatar-9.png",
          lastMessage: "Are you still there?",
          lastSent: DateTime.now(),
          unreadCount: 0,
          online: true),
      ConversationModel(
          sender: "Saravanath",
          avatar: "assets/images/avatar-10.png",
          lastMessage: "Are you still there?",
          lastSent: DateTime.now(),
          unreadCount: 0,
          online: false),
      ConversationModel(
          sender: "Saravanath",
          avatar: "assets/images/avatar-11.png",
          lastMessage: "Are you still there?",
          lastSent: DateTime.now(),
          unreadCount: 2,
          online: true),
      ConversationModel(
          sender: "Saravanath",
          avatar: "assets/images/avatar-12.png",
          lastMessage: "Are you still there?",
          lastSent: DateTime.now(),
          unreadCount: 2,
          online: false),
      ConversationModel(
          sender: "Saravanath",
          avatar: "assets/images/avatar-1.png",
          lastMessage: "Are you still there?",
          lastSent: DateTime.now(),
          unreadCount: 2,
          online: true),
      ConversationModel(
          sender: "Saravanath",
          avatar: "assets/images/avatar-2.png",
          lastMessage: "Are you still there?",
          lastSent: DateTime.now(),
          unreadCount: 2,
          online: false),
      ConversationModel(
          sender: "Saravanath",
          avatar: "assets/images/avatar-3.png",
          lastMessage: "Are you still there?",
          lastSent: DateTime.now(),
          unreadCount: 2,
          online: true),
      ConversationModel(
          sender: "Saravanath",
          avatar: "assets/images/avatar-4.png",
          lastMessage: "Are you still there?",
          lastSent: DateTime.now(),
          unreadCount: 2,
          online: true),
      ConversationModel(
          sender: "Saravanath",
          avatar: "assets/images/avatar-5.png",
          lastMessage: "Are you still there?",
          lastSent: DateTime.now(),
          unreadCount: 2,
          online: true)
    ]);
  }

  List<MessageModel> getMessages(String userId, String friendId) {
    return List.from([
      MessageModel(
          sender: "",
          type: MessageType.text,
          files: [],
          content: "Hello, how are you?",
          isMe: false),
      MessageModel(
          sender: "",
          type: MessageType.text,
          files: [],
          content: "Hello, I am fine. \nLong time no see. \nAbout you?",
          isMe: true),
      MessageModel(
          sender: "",
          type: MessageType.text,
          files: [],
          content:
              "Contrary to popular belief, Lorem Ipsum is not simply random text.",
          isMe: false),
      MessageModel(
          sender: "",
          type: MessageType.photos,
          files: [
            FileModel(
                path: "assets/images/sample-1.jpg", contentType: "image/png"),
            FileModel(
                path: "assets/images/avatar-1.png", contentType: "image/gif"),
            FileModel(
                path: "assets/images/avatar-2.png", contentType: "image/tif")
          ],
          content:
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
          isMe: true),
      MessageModel(
          sender: "",
          type: MessageType.text,
          files: [],
          content:
              "The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. ",
          isMe: false),
      MessageModel(
          sender: "",
          type: MessageType.text,
          files: [],
          content:
              "It has roots in a piece of classical Latin literature from 45 BC",
          isMe: false),
      MessageModel(
          sender: "",
          type: MessageType.photos,
          files: [
            FileModel(
                path: "assets/images/sample-1.jpg", contentType: "image/png"),
            FileModel(
                path: "assets/images/avatar-1.png", contentType: "image/gif"),
            FileModel(
                path: "assets/images/avatar-2.png", contentType: "image/tif")
          ],
          content:
              "Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.",
          isMe: false),
      MessageModel(
          sender: "",
          type: MessageType.text,
          files: [],
          content:
              "Contrary to popular belief, Lorem Ipsum is not simply random text.",
          isMe: true)
    ]);
  }
}
