import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dorm_link/src/features/auth/register.dart';
import 'package:http/http.dart' as http;

class MessAttendance extends StatefulWidget {
  const MessAttendance({super.key, required this.token});

  final String token;

  @override
  State<MessAttendance> createState() => _MessAttendanceState();
}

class _MessAttendanceState extends State<MessAttendance> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, bool> _events = {};

  void _generateEvents() async {
    final messUrl = Uri.parse("$baseUrl/attendance");
    http.Response response = await http.get(
      messUrl,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': widget.token
      },
    );
    var json = jsonDecode(response.body);
    print(json);


    for (int i = 1; i <= 30; i++) {
      DateTime date = DateTime.utc(2024, 04, i);
      print(date);
      if (i % 2 == 0) {
        _events[date] = true;
      } else {
        _events[date] = false;
      }
    }
  }

  @override
  void initState() {
    _generateEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(),
        body: SafeArea(
          child: TableCalendar(
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16.0),
            ),
            calendarFormat: _calendarFormat,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            eventLoader: _getEventsForDay,
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (_events[date] == true) {
                  return Positioned(
                    right: 1,
                    bottom: 1,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  );
                } else {
                  return Positioned(
                    right: 1,
                    bottom: 1,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  );
                }
              },
            ),
            availableCalendarFormats: {CalendarFormat.month: ''},
            // Only month view
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              defaultTextStyle: TextStyle(color: Colors.blue),
              weekNumberTextStyle: TextStyle(color: Colors.red),
              weekendTextStyle: TextStyle(color: Colors.pink),
              selectedTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16.0),
              rangeStartTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16.0),
              rangeEndTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16.0),
            ),
          ),
        ));
  }

  List<bool> _getEventsForDay(DateTime day) {
    return [_events[day] ?? true];
  }
}
