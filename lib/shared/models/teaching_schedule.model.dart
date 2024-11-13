class TeachingScheduleModel {
  const TeachingScheduleModel(
      {required this.id,
      required this.dateStart,
      required this.timeStart,
      required this.timeEnd,
      required this.booked});

  final String id;
  final DateTime dateStart;
  final DateTime timeStart;
  final DateTime timeEnd;
  final bool booked;
}
