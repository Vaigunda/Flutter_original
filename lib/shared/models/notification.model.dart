import 'mentor.model.dart';

class NotificationModel {
  final String id;
  final String title;
  final String? message;
  final DateTime dateTime;
  final bool isRead;
  final MentorModel initiatedUser;

  NotificationModel(
      {required this.id,
      required this.title,
      this.message,
      required this.dateTime,
      required this.initiatedUser,
      this.isRead = false});
}
