import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mentor/shared/models/teaching_schedule.model.dart';
import 'package:mentor/shared/shared.dart';
import 'package:mentor/shared/views/calendar_booking.dart';
import 'package:mentor/shared/views/input_field.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../shared/models/connect_method.model.dart';
import '../../shared/models/mentor.model.dart';
import '../../shared/providers/connect_method.provider.dart';
import '../../shared/providers/mentors.provider.dart';
import '../../shared/views/button.dart';

class BecomeMentorScreen extends StatefulWidget {
  const BecomeMentorScreen({super.key, required this.profileId});
  final String profileId;
  @override
  State<BecomeMentorScreen> createState() => _BecomeMentorScreenState();
}

class _BecomeMentorScreenState extends State<BecomeMentorScreen> {
  final List<ConnectMethodModel> connectMethods =
      ConnectMethodProvider.shared.connectMethods;
  final TimeOfDay _time = const TimeOfDay(hour: 20, minute: 0);
  late MentorModel? mentor;
  TextEditingController linkConnectCtrl = TextEditingController();
  TextEditingController planTeachingCtrl = TextEditingController();
  int _index = 0;
  String _errorMessage = "";
  DateTime _selectedDay = DateTime.now();
  List<TeachingScheduleModel> schedules = [];
  List<Map<String, dynamic>> formData = [
    {"message": "Please upload avatar", "value": null},
    {"message": "Please enter connect method", "value": null},
    {
      "message": "Please describe what do you can inspire your mentee",
      "value": null
    },
    {"message": "Please choose your available time", "value": null},
  ];

  @override
  void initState() {
    super.initState();
    // dataSource = _getCalendarDataSource();
    mentor = MentorsProvider.shared.getMentor(widget.profileId);
  }

  @override
  void dispose() {
    super.dispose();
    linkConnectCtrl.dispose();
    planTeachingCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Become a mentor"),
          leading: IconButton(
            icon: const Icon(FontAwesomeIcons.chevronLeft),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(child: becomeMentorStepperForm())));
  }

  onStepCancel() {
    if (_index > 0) {
      setState(() {
        _index -= 1;
      });
    }
  }

  onStepContinue() {
    if (_index == 0 && formData[_index]["value"] == null) {
      formData[_index]["value"] = mentor!.avatarUrl;
    }

    if (formData[_index]["value"] == null ||
        (_index == 1 && linkConnectCtrl.text.isEmpty)) {
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

  Widget becomeMentorStepperForm() {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_index == 0)
              renderUploadAvatar()
            else if (_index == 1)
              renderConnectMethod()
            else if (_index == 2)
              renderPlanTeaching()
            else if (_index == 3)
              renderSelectAvailableTime(),
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
                      label: "Submit",
                      onPressed: () => {
                            //TODO: submit booking here
                            context.pop()
                          }),
              ],
            ),
          ],
        ));
  }

  Widget renderUploadAvatar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        renderHeaderStep("Update your avatar"),
        Center(
            child: Stack(alignment: Alignment.center, children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(mentor!.avatarUrl),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: context.colors.onPrimary,
                      borderRadius: BorderRadius.circular(30)),
                  child: Icon(Icons.add_a_photo_outlined,
                      color: context.colors.primary)))
        ]))
      ],
    );
  }

  Widget renderConnectMethod() {
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
                hint: const Text("Select method to connect"),
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
            )),
        const SizedBox(height: 10),
        if (formData[_index]["value"] != null) ...[
          InputField(
            controller: linkConnectCtrl,
            labelText: formData[_index]["value"] != "3"
                ? "Enter link to access connect"
                : "Enter address",
          )
        ]
      ],
    );
  }

  Widget renderPlanTeaching() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        renderHeaderStep("Describe what can you inspire to your mentees"),
        const SizedBox(height: 10),
        InputField(
          onChanged: (value) {
            setState(() {formData[_index]["value"] = value;});
          },
          controller: planTeachingCtrl,
          maxLines: 15,
        )
      ],
    );
  }

  Widget renderSelectAvailableTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            renderHeaderStep("Select available time"),
            CustomButton(label: "Add time", onPressed: addSchedule)
          ],
        ),
        CalendarBooking(
            selectedDay: _selectedDay, onDaySelected: _onDaySelected),
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
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
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
              subtitle: Text(DateFormat("yyyy/MM/dd").format(value.dateStart),
                  style: context.bodySmall),
            ),
          )
      ],
    );
  }

  Widget renderHeaderStep(label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
      });
    }
  }
}
