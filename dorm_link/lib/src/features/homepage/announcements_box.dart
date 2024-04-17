import 'package:dorm_link/src/features/homepage/announcement_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dorm_link/src/features/auth/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnnouncementsBox extends StatefulWidget {
  const AnnouncementsBox({super.key});

  @override
  State<AnnouncementsBox> createState() => _AnnouncementsBoxState();
}

class _AnnouncementsBoxState extends State<AnnouncementsBox> {

  final _client = http.Client();
  int noOfAnnouncements = 0;
  List<String> _titles = [];
  List<String> _contents = [];

  @override
  void initState() {
   _getAnnouncements();
    super.initState();
  }

  void _getAnnouncements() async {
    var token = '';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      token = preferences.getString("token") ?? '';
    });
    final announcementUrl = Uri.parse("$baseUrl/announcements");
    http.Response response = await _client.get(
      announcementUrl,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': token
      },
    );
    var json = jsonDecode(response.body);
    noOfAnnouncements = json.length;
    for(int i=0; i<noOfAnnouncements; ++i){
      print(json[i]["title"]);
      _titles.add(json[i]["title"]);
      _contents.add(json[i]["content"]);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Announcements",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onBackground),
            ),
            const Spacer(),
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
              itemCount: noOfAnnouncements,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child:AnnouncementCard(
                      title: _titles[index],
                      description: _contents[index],
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
