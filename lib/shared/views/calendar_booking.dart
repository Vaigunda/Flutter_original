import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBooking extends StatefulWidget {
  CalendarBooking(
      {super.key,
      required this.selectedDay,
      required this.onDaySelected,
      this.getEventsForDay});
  DateTime selectedDay;
  Function onDaySelected;
  List<Object?> Function(DateTime)? getEventsForDay;
  @override
  State<CalendarBooking> createState() => _CalendarBookingState();
}

class _CalendarBookingState extends State<CalendarBooking> {
  DateTime kFirstDay = DateTime.now();
  DateTime kLastDay = DateTime.now().add(const Duration(days: 365));
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: _focusedDay,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarFormat: _calendarFormat,
      eventLoader: widget.getEventsForDay,
      calendarStyle: const CalendarStyle(
        markersAlignment: Alignment.bottomRight,
      ),
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, day, events) => events.isNotEmpty
            ? Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  '${events.length}',
                  style: const TextStyle(color: Colors.white),
                ),
              )
            : null,
      ),
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      selectedDayPredicate: (day) {
        // Use `selectedDayPredicate` to determine which day is currently selected.
        // If this returns true, then `day` will be marked as selected.

        // Using `isSameDay` is recommended to disregard
        // the time-part of compared DateTime objects.
        return isSameDay(widget.selectedDay, day);
      },
      onPageChanged: (focusedDay) {
        // No need to call `setState()` here
        _focusedDay = focusedDay;
      },
      onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
        setState(() {
          _focusedDay = focusedDay;
        });
        widget.onDaySelected(selectedDay, focusedDay);
      },
    );
  }
}
