import 'dart:convert';

import 'package:dorm_link/src/models/washing_machine.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dorm_link/src/features/auth/register.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TimeSlot extends StatefulWidget {
  const TimeSlot(
      {super.key,
      required this.hour,
      required this.washingMachine,
      required this.token});

  final int hour;
  final WashingMachine washingMachine;
  final String token;

  @override
  State<TimeSlot> createState() => _TimeSlotState();
}

class _TimeSlotState extends State<TimeSlot> {

  @override
  void initState() {
    myEnrollmentNumber();
    super.initState();
  }
  String myEnrollmentNum = "";
  void bookSlot() async {
    final bookUrl =
        Uri.parse("$baseUrl/washingmachine/${widget.washingMachine.id}/book");
    http.Response response = await http.post(
      bookUrl,
      body: jsonEncode({'slotIndex': widget.hour}),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': widget.token
      },
    );
    print(response.statusCode.toString());
  }

  Color getChipColor() {
    if (DateTime.now().hour > widget.hour) {
      return Colors.grey;
    }
    bool isFree =
        widget.washingMachine.slots[widget.hour] == null ? true : false;
    if (!isFree) {
      return Colors.yellow.withOpacity(0.3);
    } else {
      return Colors.white;
    }
  }

  void myEnrollmentNumber() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      myEnrollmentNum = preferences.getString("enrollmentNo") ?? '';
    });
  }
  @override
  Widget build(BuildContext context) {
    bool isFree =
        widget.washingMachine.slots[widget.hour] == null ? true : false;

    String ampm = "AM";
    int time12Hour = widget.hour;
    if (time12Hour >= 12) {
      time12Hour -= 12;
      ampm = "PM";
    }
    if (time12Hour == 0) {
      time12Hour = 12;
    }

    return GestureDetector(
      onTap: () {
        if (widget.hour < DateTime.now().hour) {
          return;
        }
        if (isFree == false) {
          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                      title: Text(
                        "Slot Already Booked",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                      content: Text(
                        "This Slot is already booked by ${widget.washingMachine.slots[widget.hour]}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("OK")),
                      ]));
          return;
        }
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                    title: Text(
                      "Confirm Booking",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    content: Text(
                      "Are you sure you want to book the slot for ${widget.hour}:00 $ampm - ${widget.hour + 1}:00 $ampm",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Text("Cancel")),
                      TextButton(
                          onPressed: () {
                            for (int i = 0; i < 24; i++) {
                              if (widget.washingMachine.slots[i] == "You" || widget.washingMachine.slots[i] == myEnrollmentNum) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    "You can only book 1 slot in a day",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background),
                                  ),
                                ));
                                Navigator.of(ctx).pop();
                                return;
                              }
                            }
                            setState(() {
                              isFree = false;
                              widget.washingMachine.slots[widget.hour] = "You";
                            });
                            bookSlot();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "Slot Booked",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                              ),
                            ));

                            Navigator.of(ctx).pop();
                          },
                          child: Text("Confirm")),
                    ]));
      },
      child: Container(
        //padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: getChipColor(),
            border: Border.all(color: Colors.black.withOpacity(0.2))),
        child: Center(
            child: Text("$time12Hour:00 $ampm",
                style: GoogleFonts.inter(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 12,
                    fontWeight: FontWeight.w500))),
      ),
    );
  }
}
