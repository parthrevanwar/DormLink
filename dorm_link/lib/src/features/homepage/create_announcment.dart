import 'package:dorm_link/src/Common_widgets/custombigbutton.dart';
import 'package:dorm_link/src/features/complaints/complaints_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dorm_link/src/features/auth/register.dart';



class NewAnnouncement extends StatefulWidget {
  const NewAnnouncement({super.key});

  @override
  State<NewAnnouncement> createState() => _NewAnnouncement();
}

class _NewAnnouncement extends State<NewAnnouncement> {
  final _client = http.Client();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final List<String> hostels = ['bh1', 'bh2', 'bh3', 'bh4','bh5','gh1', 'gh2', 'gh3'];
  final List<String> selectedHostels = [];

  void _toggleSelection(String hostel) {
    setState(() {
      if (selectedHostels.contains(hostel)) {
        selectedHostels.remove(hostel);
      } else {
        selectedHostels.add(hostel);
      }
    });
  }

  @override
  void createannouncement() async {
    var token = '';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      token = preferences.getString("token") ?? '';
    });
    final messUrl = Uri.parse("$baseUrl/announcements");
    http.Response response = await _client.post(
        messUrl,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'authorization': token
        },
        body: jsonEncode({
          'title' : titleController.text,
          'content' : descriptionController.text,
          'hostels': selectedHostels,
        })
    );
    print(response.statusCode);
    var json = jsonDecode(response.body);
    print(json);
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Announcement Created",
            style: TextStyle(color: Colors.white),
          )));
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            response.body,
            style: const TextStyle(color: Colors.white),
          )));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('New Complaint'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 55.0, bottom: 30),
                    child: Container(
                      alignment: Alignment.topLeft,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4A9DFF),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(45),
                          bottomRight: Radius.circular(45),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15),
                        child: Text(
                          'New Complaint',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: hostels.length,
                itemBuilder: (context, index) {
                  final hostel = hostels[index];
                  final isSelected = selectedHostels.contains(hostel);
                  return GestureDetector(
                    onTap: () => _toggleSelection(hostel),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blue ,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          hostel,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        labelText: 'Title',
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                      controller: descriptionController,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: 'content',
                        labelText: 'content',
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    CustomBigButton(
                      onTap: createannouncement,
                      title: "Send",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
