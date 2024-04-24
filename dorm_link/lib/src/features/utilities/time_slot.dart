import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeSlot extends StatelessWidget {
  const TimeSlot({super.key, required this.hour, required this.isFree});

  final int hour;
  final bool isFree;

  @override
  Widget build(BuildContext context) {

    Color getColor(int hour) {
      int currHour = DateTime.now().hour;
      if (hour < currHour) {
        return Colors.grey;
      }
      if(!isFree){
        return Colors.yellow.withOpacity(0.3);
      }
      return Colors.white;
    }
    String ampm = "AM";
    int time12Hour = hour;
    if(time12Hour>=12) {
      time12Hour -= 12;
      ampm = "PM";
    }
    if(time12Hour==0) {
      time12Hour = 12;
    }

    return GestureDetector(
      onTap: (){},
      child: Container(
        //padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: getColor(hour), border: Border.all(color: Colors.black.withOpacity(0.2))),
        child: Center(
            child: Text("$time12Hour:00 $ampm",
                style: GoogleFonts.inter(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 14,
                    fontWeight: FontWeight.w500))),
      ),
    );
  }
}
