import 'package:dorm_link/src/features/utilities/book_slot.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WashingMachineCard extends StatelessWidget {
  const WashingMachineCard(this.washingMachineName,
      {super.key, required this.isFree});

  final String washingMachineName;
  final bool? isFree;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => BookSlot()));
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(14, 18, 18, 18),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              washingMachineName,
              style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: isFree! ? Colors.green : Colors.red,
                  size: 12,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  isFree! ? "Currently Free" : "In use",
                  style: GoogleFonts.inter(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
