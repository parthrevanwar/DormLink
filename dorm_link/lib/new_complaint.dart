import 'package:dorm_link/complaints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './complaint_card.dart';
import './ticket.dart';
import './complaints.dart';

final nameController = TextEditingController();
final subjectController = TextEditingController();
final emailController = TextEditingController();
final messageController = TextEditingController();

class NewComplaint extends StatefulWidget {
  const NewComplaint({super.key});

  @override
  State<NewComplaint> createState() => _NewComplaintState();
}

class _NewComplaintState extends State<NewComplaint> {
  @override
  void sendEmail() {
    unresolved.add(TicketButton(
        heading: subjectController.text, description: messageController.text));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => complaints(),
      ),
    );
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
              padding: EdgeInsets.fromLTRB(25, 14, 25, 0),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.account_circle),
                        hintText: 'Name',
                        labelText: 'Name',
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: subjectController,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.email),
                        hintText: 'Roll No',
                        labelText: 'Roll No',
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.subject_rounded),
                        hintText: 'Subject',
                        labelText: 'Subject',
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: messageController,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.message),
                        hintText: 'Complaint',
                        labelText: 'Complaint',
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: sendEmail,
                      child: Text('Send'),
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
