import 'package:carousel_slider/carousel_slider.dart';
import 'package:dorm_link/src/features/homepage/menu_card.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class MenuBox extends StatefulWidget {
  MenuBox({super.key});

  @override
  State<MenuBox> createState() => _MenuBoxState();
}

class _MenuBoxState extends State<MenuBox> {
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 4,
            viewportFraction: 1,
            initialPage: 2,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: const [
            MenuCard(
              title: "Breakfast",
              description: "Poha",
            ),MenuCard(
              title: "Lunch",
              description: "aalu",
            ),MenuCard(
              title: "Dinner",
              description: "roti",
            ),
          ],
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
