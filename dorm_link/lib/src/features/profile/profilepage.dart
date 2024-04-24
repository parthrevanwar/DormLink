import 'package:dorm_link/src/Common_widgets/customappbar.dart';
import 'package:dorm_link/src/features/auth/login.dart';
import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import './main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {

    void logOut() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => LoginPage()));
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 250, 255),
      body: Column(
        children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomAppBar(title: "Profile"),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: IconButton(
                  onPressed: logOut,
                  icon: const Icon(Icons.settings),
                  iconSize: 35,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20,),
        Container(
          child: Column(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child:
                    const Image(image: AssetImage('assets/images/shashank.jpg')),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: const Center(
                    child: Text(
                      'SHASHANK ARORA',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color(0xFF2B2E35),
                      ),
                    )),
              ),
              Container(
                child: const Text('IIT2022502',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF70788A),
                    )),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Center(
                            child: Text('Hostel',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                    color: Theme.of(context).colorScheme.onBackground
                                )),
                          ),
                          Center(
                            child: Text('BH-3',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                    color: Theme.of(context).colorScheme.onBackground
                                )),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Center(
                            child: Text('Room No',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                    color: Theme.of(context).colorScheme.onBackground
                                )),
                          ),
                          Center(
                            child: Text('714',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                    color: Theme.of(context).colorScheme.onBackground
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
             Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Caretaker',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                              color: Theme.of(context).colorScheme.onBackground
                          ),
                        ),
                        Text('Mr Ram Prakash',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                                color: Theme.of(context).colorScheme.onBackground
                            )),
                      ],
                    ),
                    const Spacer(),
                    const Center(child: Icon(Icons.call)),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Warden',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                              color: Theme.of(context).colorScheme.onBackground
                          ),
                        ),
                        Text('Dr. Bhupendra Jogi',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                                color: Theme.of(context).colorScheme.onBackground
                            )),
                      ],
                    ),
                    Spacer(),
                    Center(child: Icon(Icons.call)),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
      ),
      //bottomNavigationBar: gnav(),
    );
  }
}
