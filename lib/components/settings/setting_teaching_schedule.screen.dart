import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mentor/shared/shared.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../shared/models/teaching_schedule.model.dart';
import '../../shared/views/button.dart';
import '../../shared/views/calendar_booking.dart';

class SettingTeachingScheduleScreen extends StatefulWidget {
  const SettingTeachingScheduleScreen({super.key});

  @override
  State<SettingTeachingScheduleScreen> createState() =>
      _SettingTeachingScheduleScreenState();
}

class _SettingTeachingScheduleScreenState
    extends State<SettingTeachingScheduleScreen> {
  final TimeOfDay _time = const TimeOfDay(hour: 20, minute: 0);
  DateTime _selectedDay = DateTime.now();
  String _errorMessage = "";
  List<TeachingScheduleModel> schedules = [];

  void addSchedule() async {
    _errorMessage = "";
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (newTime != null) {
      var startTime = DateTime(_selectedDay.year, _selectedDay.month,
          _selectedDay.day, newTime.hour, newTime.minute);

      schedules.add(TeachingScheduleModel(
          id: "",
          dateStart: _selectedDay,
          timeStart: startTime,
          timeEnd: startTime.add(const Duration(hours: 1)),
          booked: false));
      setState(() {});
    }
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Setting teaching schedule"),
          leading: IconButton(
            icon: const Icon(FontAwesomeIcons.chevronLeft),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
            context.pop();
          },
          label: const Text('Save'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomButton(label: "Add time", onPressed: addSchedule)
                      ],
                    ),
                    CalendarBooking(
                        selectedDay: _selectedDay,
                        onDaySelected: _onDaySelected),
                    for (var value in schedules)
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          trailing: PopupMenuButton<String>(
                            // Callback that sets the selected popup menu item.
                            onSelected: (String item) {},
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: "1",
                                child: Text("Repeat every week"),
                              ),
                              const PopupMenuItem<String>(
                                value: "2",
                                child: Text("Repeat every month"),
                              ),
                              const PopupMenuItem<String>(
                                value: "3",
                                child: Text("Remove"),
                              ),
                            ],
                          ),
                          title: Text(
                              '${DateFormat.Hm().format(value.timeStart)} - ${DateFormat.Hm().format(value.timeEnd)}',
                              style: context.titleSmall),
                          subtitle: Text(
                              DateFormat("yyyy/MM/dd").format(value.dateStart),
                              style: context.bodySmall),
                        ),
                      )
                  ],
                ))));
  }
}
