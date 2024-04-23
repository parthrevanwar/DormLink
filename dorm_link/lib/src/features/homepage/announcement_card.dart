import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({
    super.key,
    required this.title,
    required this.createdBy,
    required this.date,
  });

  final String title;
  final String createdBy;
  final String date;

  @override
  Widget build(BuildContext context) {
    String getFormattedDate(String stringDate){
      return stringDate.substring(0,10);

    }
     //print(DateTime(createdBy).day);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context).colorScheme.primary),
            child: Center(
                child: Text(
              createdBy[0],
              style: TextStyle(fontSize: 20),
            )),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onBackground),
                textAlign: TextAlign.left,
              ),
              //const SizedBox(height: 1),
              Row(
                children: [
                  Text(
                    createdBy,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      "•",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                  Text(
                    getFormattedDate(date),
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
