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
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          const Icon(Icons.text_snippet),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  child: const Text(
                                    "Mess Rebate Form",
                                    textAlign: TextAlign.left,
                                  )),
                              SizedBox(height: 1),
                              Text("Fill the form before 6 Nov 2023")
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
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
