import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mentor/shared/models/category.model.dart';
import 'package:mentor/shared/models/connect_method.model.dart';
import 'package:mentor/shared/models/teaching_schedule.model.dart';
import 'package:mentor/shared/providers/connect_method.provider.dart';
import 'package:mentor/shared/providers/teaching_schedule.provider.dart';
import 'package:mentor/shared/shared.dart';
import 'package:mentor/shared/views/button.dart';
import 'package:mentor/shared/views/calendar_booking.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../shared/models/mentor.model.dart';
import '../../shared/providers/mentors.provider.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key, required this.profileId});
  final String profileId;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late List<TeachingScheduleModel> _selectedEvents;

  late final kEvents;
  late final _kEventSource;
  late MentorModel? mentor;
  int _index = 0;
  String _errorMessage = "";
  DateTime _selectedDay = DateTime.now();
  final List<TeachingScheduleModel> teachSchedule =
      TeachingScheduleProvider.shared.teachingSchedule;
  final List<ConnectMethodModel> connectMethods =
      ConnectMethodProvider.shared.connectMethods;

  List<Map<String, dynamic>> formData = [
    {"message": "Please choose a category", "value": null},
    {"message": "Please booking time", "value": null},
    {"message": "Please select method connect", "value": null},
  ];

  @override
  void initState() {
    super.initState();
    mentor = MentorsProvider.shared.getMentor(widget.profileId);
    _kEventSource = {
      for (var item in teachSchedule)
        item.dateStart: teachSchedule
            .where(((schedule) =>
                schedule.timeStart.compareTo(item.dateStart) >= 0 &&
                schedule.timeEnd.compareTo(
                        item.dateStart.add(const Duration(hours: 24))) <=
                    0))
            .toList()
    };

    kEvents = LinkedHashMap<DateTime, List<TeachingScheduleModel>>(
      equals: isSameDay,
    )..addAll(_kEventSource);

    _selectedEvents = _getEventsForDay(_selectedDay);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Booking ${mentor!.name}"),
          leading: IconButton(
            icon: const Icon(FontAwesomeIcons.chevronLeft),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(child: bookingStepperForm())));
  }

  onStepCancel() {
    if (_index > 0) {
      setState(() {
        _index -= 1;
      });
    }
  }

  onStepContinue() {
    if (formData[_index]["value"] == null) {
      setState(() {
        _errorMessage = formData[_index]["message"];
      });
      print(_errorMessage);
      return;
    }
    setState(() {
      _index += 1;
      _errorMessage = "";
    });
  }

  StepState stateStep(index) {
    return _index > index
        ? StepState.complete
        : _index == index
            ? StepState.editing
            : StepState.disabled;
  }

  Widget bookingStepperForm() {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_index == 0)
              renderSelectCategory()
            else if (_index == 1)
              renderSelectTime()
            else if (_index == 2)
              renderSelectMethodConnect()
            else if (_index == 3)
              renderSubmitBooking(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (_index != 0)
                  CustomButton(
                    label: "Previous",
                    onPressed: onStepCancel,
                    type: EButtonType.outline,
                  ),
                const SizedBox(width: 10),
                if (_index < 3)
                  CustomButton(label: "Next", onPressed: onStepContinue),
                if (_index == 3)
                  CustomButton(
                      label: "Booking",
                      onPressed: () => {
                            //TODO: submit booking here
                            context.pop()
                          }),
              ],
            ),
          ],
        ));
  }

  Widget renderSelectCategory() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      renderHeaderStep("Select a category"),
      for (var item in [
        ...mentor!.categories,
        CategoryModel(
            id: 'other', name: "Other", icon: FontAwesomeIcons.circleQuestion) // changed icon: FontAwesomeIcons.circleQuestion to icon: "circleQuestion"
      ])
        ListTile(
          minLeadingWidth: 10,
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          dense: true,
          tileColor: Colors.transparent,
          title: Text(item.name,
              style: context.bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface)),
          leading: Radio<String>(
            value: item.id,
            groupValue: formData[_index]["value"],
            onChanged: (String? value) {
              setState(() {
                formData[_index]["value"] = value;
              });
            },
          ),
        ),
    ]);
  }

  Widget renderSelectTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        renderHeaderStep("Select day has dot"),
        CalendarBooking(
          selectedDay: _selectedDay,
          onDaySelected: _onDaySelected,
          getEventsForDay: _getEventsForDay,
        ),
        const SizedBox(height: 8.0),
        for (var value in _selectedEvents)
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 4.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: value.booked ? context.colors.error : Colors.green,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListTile(
              selected: formData[_index]["value"] == value.id,
              selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
              onTap: () => {
                if (!value.booked)
                  {
                    setState(() {
                      formData[_index]["value"] =
                          formData[_index]["value"] == value.id
                              ? null
                              : value.id;
                    })
                  }
              },
              title: Text(
                  '${DateFormat.Hm().format(value.timeStart)} - ${DateFormat.Hm().format(value.timeEnd)}',
                  style: context.titleSmall),
              subtitle: Text(value.booked ? "Occupied" : "Available",
                  style: context.bodySmall!.copyWith(
                      color:
                          value.booked ? context.colors.error : Colors.green)),
            ),
          )
      ],
    );
  }

  Widget renderSelectMethodConnect() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        renderHeaderStep("Select method connect"),
        DecoratedBox(
            decoration: BoxDecoration(
              //border of dropdown button
              border: Border.all(
                  color: Theme.of(context).colorScheme.outline, width: 1),
              borderRadius:
                  BorderRadius.circular(8), //border raiuds of dropdown button
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownButton<String>(
                focusColor: Colors.transparent,
                isExpanded: true,
                isDense: true,
                underline: Container(),
                value: formData[_index]["value"],
                hint: const Text("Select method to connect with mentor"),
                items: connectMethods.map((ConnectMethodModel value) {
                  return DropdownMenuItem<String>(
                    value: value.id,
                    child: Text(value.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    formData[_index]["value"] = value;
                  });
                },
              ),
            ))
      ],
    );
  }

  Widget renderSubmitBooking() {
    var category = mentor!.categories
        .firstWhere((element) => element.id == formData[0]["value"]);
    var studySchedule = teachSchedule
        .firstWhere((element) => element.id == formData[1]["value"]);
    var method = connectMethods
        .firstWhere((element) => element.id == formData[2]["value"]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Your booking information: ", style: context.titleSmall),
        const SizedBox(
          height: 10,
        ),
        Text("Mentor:", style: context.titleSmall),
        Text(mentor!.name),
        const SizedBox(
          height: 10,
        ),
        Text("Category:", style: context.titleSmall),
        Text(category.name),
        const SizedBox(
          height: 10,
        ),
        Text("Study schedule:", style: context.titleSmall),
        Text(
            "${DateFormat.Hm().format(studySchedule.timeStart)} - ${DateFormat.Hm().format(studySchedule.timeEnd)}"),
        const SizedBox(
          height: 10,
        ),
        Text("Connect method", style: context.titleSmall),
        Text(method.name),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget renderHeaderStep(label) {
    return Column(
      children: [
        Text(label, style: context.titleSmall),
        const SizedBox(
          height: 10,
        ),
        if (_errorMessage.isNotEmpty)
          Text(_errorMessage,
              style: context.bodySmall!.copyWith(color: context.colors.error)),
      ],
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        // _focusedDay = focusedDay;
      });
      _selectedEvents = _getEventsForDay(selectedDay);
    }
  }

  // get teaching schedule by day
  List<TeachingScheduleModel> _getEventsForDay(DateTime day) {
    var utc = DateTime.utc(day.year, day.month, day.day);
    return kEvents[utc] ?? [];
  }
}
