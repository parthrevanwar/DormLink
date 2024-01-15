import 'package:flutter/material.dart';

class UserBox extends StatelessWidget {
  const UserBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF4A9DFF),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 18.0, top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Room No.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            Text(
              '356',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Room-mate',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            Text(
              'Vraj Shah',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

