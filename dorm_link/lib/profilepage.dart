import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            iconSize: 50,
          ),
        ),
        Container(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              //child: const Image(image: AssetImage('shashank.jpg')),
            ),
          ),
        ),
      ]),
    );
  }
}
