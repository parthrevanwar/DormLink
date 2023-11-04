import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'announcements.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final name = "Shashank";
    return Column(
      children: [
        // SizedBox(
        //   height: 10,
        // ),
        const Center(
          child: Text(
            'BH-1',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),

        SizedBox(
          height: 20,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hello $name!',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        // Text(
        //   'Hello $name',
        //   textAlign: TextAlign.left,
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
          child: Center(
            child: Container(
              height: 140,
              width: 320,
              // color: Color.fromARGB(255, 74, 158, 255),
              decoration: BoxDecoration(
                color: Color(0xFF4A9DFF),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
          // child: ListView.builder(
          //   scrollDirection: Axis.horizontal,
          //   itemCount: 4,
          //   itemBuilder: (context, index),
          // ),
        ),

        Container(
          height: 100,
          width: 320,
          // child: Text('Hello'),

          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  Icons.food_bank,
                  size: 35,
                ),
              ),
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Text(
                        textAlign: TextAlign.left,
                        "Dinner",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  Text('Chhola, Aloooo, Rice, Rasgulla'),
                ],
              )
            ],
          ),
        ),
        announcements(),
      ],
    );
  }
}
