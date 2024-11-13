class ReviewModel {
  const ReviewModel(
      {required this.message,
      required this.createDate,
      required this.createById});

  final String message;
  final DateTime createDate;
  final String createById;
}
