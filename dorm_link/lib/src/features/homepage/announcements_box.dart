import 'package:dorm_link/src/features/homepage/announcement_card.dart';
import 'package:flutter/material.dart';

class announcements extends StatelessWidget {
  const announcements({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Announcements",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.underline),
                ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
          stream: null,
          builder: (context, snapshot) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){},
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child:AnnouncementCard(
                      title: 'Mess Rebate Form',
                      description: 'Fill the form before 6 Nov 2023',
                    ),
                  ),
                );
              },
            );
          },
        ),

      ],
    );
  }
}
