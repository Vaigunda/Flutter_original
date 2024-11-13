import 'package:mentor/shared/models/teaching_schedule.model.dart';

class TeachingScheduleProvider {
  static TeachingScheduleProvider get shared => TeachingScheduleProvider();
  List<TeachingScheduleModel> get teachingSchedule => [
        TeachingScheduleModel(
            id: "1",
            dateStart: DateTime.utc(
                DateTime.now().year, DateTime.now().month, DateTime.now().day),
            timeStart: DateTime.now(),
            timeEnd: DateTime.now().add(const Duration(hours: 1)),
            booked: false),
        TeachingScheduleModel(
            id: "4",
            dateStart: DateTime.utc(
                DateTime.now().year, DateTime.now().month, DateTime.now().day),
            timeStart: DateTime.now().add(const Duration(hours: 1)),
            timeEnd: DateTime.now().add(const Duration(hours: 2)),
            booked: true),
        TeachingScheduleModel(
            id: "2",
            dateStart: DateTime.utc(DateTime.now().year, DateTime.now().month,
                DateTime.now().day + 1),
            timeStart: DateTime.now().add(const Duration(days: 1, hours: 1)),
            timeEnd: DateTime.now().add(const Duration(days: 1, hours: 2)),
            booked: true),
        TeachingScheduleModel(
            id: "3",
            dateStart: DateTime.utc(DateTime.now().year, DateTime.now().month,
                DateTime.now().day + 2),
            timeStart: DateTime.now().add(const Duration(days: 2, hours: 2)),
            timeEnd: DateTime.now().add(const Duration(days: 2, hours: 3)),
            booked: false),
      ];
}
