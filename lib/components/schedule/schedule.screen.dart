import 'package:flutter/material.dart';
import 'package:flutter_timeline/event_item.dart';
import 'package:flutter_timeline/indicator_position.dart';
import 'package:flutter_timeline/timeline.dart';
import 'package:flutter_timeline/timeline_theme.dart';
import 'package:flutter_timeline/timeline_theme_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mentor/shared/shared.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final _fromDate = DateTime.now().add(const Duration(days: -60));
  final _toDate = DateTime.now().add(const Duration(days: 60));
  static final _todayKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero,
        () => {
              if (_todayKey.currentContext != null)
                {Scrollable.ensureVisible(_todayKey.currentContext!)}
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "My schedule",
          style: context.headlineMedium,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: _days()),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Today",
            style: context.headlineSmall,
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTimeline(),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  List<Widget> _days() {
    List<Widget> days = [];
    for (int i = 0; i <= _toDate.difference(_fromDate).inDays; i++) {
      days.add(_day(_fromDate.add(Duration(days: i))));
    }
    return days;
  }

  Widget _day(DateTime date) {
    final isToday = _isToday(date);
    return Container(
      key: isToday ? _todayKey : null,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.all(6),
      width: 60,
      height: 70,
      decoration: BoxDecoration(
          color: isToday ? context.colors.primary : context.colors.onSecondary,
          borderRadius: BorderRadius.circular(4)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          DateFormat('EEE').format(date),
          style: context.bodyLarge!.copyWith(
              color:
                  isToday ? context.colors.onPrimary : context.colors.tertiary),
        ),
        Text(DateFormat('MMM d').format(date))
      ]),
    );
  }

  List<TimelineEventDisplay> get plainEventDisplay {
    return [
      TimelineEventDisplay(
          anchor: IndicatorPosition.top,
          indicatorOffset: const Offset(0, 24),
          child: _buildTimelineCard(
              "Meeting",
              "Discuss completed tasks and future tasks for the day",
              "just now",
              false,
              true),
          indicator: const Icon(FontAwesomeIcons.circleDot)),
      TimelineEventDisplay(
          anchor: IndicatorPosition.top,
          indicatorOffset: const Offset(0, 24),
          child: _buildTimelineCard(
              "Python", "Introduction to Python Course", "9:00 - 10:00"),
          indicator: const Icon(FontAwesomeIcons.circle)),
      TimelineEventDisplay(
          anchor: IndicatorPosition.top,
          indicatorOffset: const Offset(0, 24),
          child: _buildTimelineCard("Python",
              "Introduction to Python Course - Part 2", "14:00 - 15:00"),
          indicator: const Icon(FontAwesomeIcons.circle)),
      TimelineEventDisplay(
          anchor: IndicatorPosition.top,
          indicatorOffset: const Offset(0, 24),
          child: _buildTimelineCard("Python",
              "Introduction to Python Course - Part 2", "14:00 - 15:00"),
          indicator: const Icon(FontAwesomeIcons.circle))
    ];
  }

  Widget _buildTimelineCard(String title, String des, String time,
      [bool cancel = true, bool selected = false]) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: context.colors.onSecondary),
          borderRadius: BorderRadius.circular(8),
          color: selected ? context.colors.onSecondary : null),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Expanded(
                child: Text(
              title,
              style: context.bodyLarge,
            )),
            Text(time, style: context.bodySmall)
          ],
        ),
        const SizedBox(height: 10),
        Text(des),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
                child: Row(
              children: [
                const CircleAvatar(
                  radius: 12,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "Solo Moon",
                  style: context.bodySmall,
                )
              ],
            )),
            if (cancel)
              SizedBox(
                height: 30,
                child: OutlinedButton(
                  child: const Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.ban,
                        size: 14,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text("Cancel"),
                    ],
                  ),
                  onPressed: () {},
                ),
              )
          ],
        )
      ]),
    );
  }

  Widget _buildTimeline() {
    return TimelineTheme(
        data: TimelineThemeData(lineColor: context.colors.primary),
        child: Timeline(
          indicatorSize: 40,
          events: plainEventDisplay,
        ));
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return now.day == date.day &&
        now.month == date.month &&
        now.year == date.year;
  }
}
