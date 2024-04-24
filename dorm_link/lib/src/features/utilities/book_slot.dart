import 'package:dorm_link/src/features/utilities/day_slot.dart';
import 'package:dorm_link/src/models/washing_machine.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class BookSlot extends StatelessWidget {
  const BookSlot(this.washingMachine,{super.key, required this.token});

  final WashingMachine washingMachine;
  final String token;

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String formattedDateToday = DateFormat('dd MMMM, EEEE').format(today);
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .background,
        appBar: AppBar(
          title: Text("Washing Machine", style: TextStyle(color: Theme
              .of(context)
              .colorScheme
              .onBackground,),),
          backgroundColor: Colors.transparent,
          iconTheme:
          IconThemeData(color: Theme
              .of(context)
              .colorScheme
              .onBackground),
        ),
        body:SafeArea(
          minimum: EdgeInsets.all(20),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                formattedDateToday,
                style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),

            DaySlot(washingMachine, token: token),

          ],),
        )
    );
  }
}
