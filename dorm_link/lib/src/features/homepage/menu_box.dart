import 'package:carousel_slider/carousel_slider.dart';
import 'package:dorm_link/src/features/auth/register.dart';
import 'package:dorm_link/src/features/homepage/menu_card.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MenuBox extends StatefulWidget {
  const MenuBox({super.key, required this.token});

  final String token;

  @override
  State<MenuBox> createState() => _MenuBoxState();
}

class _MenuBoxState extends State<MenuBox> {
  int currentIndex = 0;
  String breakfastMenu = "Loading...";
  String lunchMenu = "Loading...";
  String dinnerMenu = "Loading...";

  @override
  void initState() {
    _getTodaysMenu();
    super.initState();
  }

  Future<void> _getTodaysMenu() async {
    final currTime = DateTime.now();
    String currHour = DateFormat('kk').format(currTime);
    int currHourInt = int.parse(currHour);
    currHourInt = currHourInt % 24;
    if (currHourInt <= 11) {
      currentIndex = 0;
    } else if (currHourInt <= 16) {
      currentIndex = 1;
    } else {
      currentIndex = 2;
    }
    final currDay = DateFormat('EEEE').format(DateTime.now()).toLowerCase();
    final messUrl = Uri.parse("$baseUrl/messmenu/$currDay");
    http.Response response = await http.get(
      messUrl,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': widget.token
      },
    );
    var json = jsonDecode(response.body);
    setState(() {
      breakfastMenu = json["breakfast"];
      lunchMenu = json["lunch"];
      dinnerMenu = json["dinner"];
      print("Menu fetched");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 4,
            viewportFraction: 1,
            initialPage: currentIndex,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: [
            MenuCard(
              title: "Breakfast",
              description: breakfastMenu,
            ),
            MenuCard(
              title: "Lunch",
              description: lunchMenu,
            ),
            MenuCard(
              title: "Dinner",
              description: dinnerMenu,
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        DotsIndicator(
          decorator: const DotsDecorator(
            color: Color.fromARGB(255, 174, 182, 210),
            activeColor: Color(0xFF4A9DFF),
          ),
          dotsCount: 3,
          position: currentIndex,
        ),
      ],
    );
  }
}
