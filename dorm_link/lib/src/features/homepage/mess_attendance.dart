import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

    for (int i = 0; i < json.length; i++) {
      int year = int.parse(json[i]["date"].substring(0, 4));
      int month = int.parse(json[i]["date"].substring(5, 7));
      int intDate = int.parse(json[i]["date"].substring(8, 10));
      DateTime date = DateTime.utc(year, month, intDate);
      _events[date] = true;
    }
    setState(() {});
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
        appBar: AppBar(
          title: Text("Mess Attendance", style: TextStyle(color: Theme.of(context).colorScheme.background),),
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.background),
        ),
        body: SafeArea(
          child: Column(children: [
            TableCalendar(
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 16.0),
              ),
              calendarFormat: _calendarFormat,
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2020, 10, 16),
              lastDay: DateTime.utc(2026, 3, 14),
              eventLoader: _getEventsForDay,
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, date, events) {
                  if (_events[date] == true) {
                    return Positioned(
                      right: 0,
                      bottom: 0,
                      child: Icon(Icons.check_circle_rounded, color: Colors.green,size: 18,)
                    );
                  } else {
                    return Positioned(
                      right: 1,
                      bottom: 1,
                      child: Visibility(visible: false,child: Icon(Icons.not_interested))
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
            const SizedBox(
              height: 32,
            ),
            Text(
              "Total present this month: ${_events.length}",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onBackground),
            )
          ]),
        ));
  }

  List<bool> _getEventsForDay(DateTime day) {
    return [_events[day] ?? false];
  }
}
