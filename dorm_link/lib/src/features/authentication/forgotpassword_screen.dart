import 'package:dorm_link/src/Common_widgets/custombigbutton.dart';
import 'package:flutter/material.dart';

import '../../Common_widgets/customappbar.dart';
import '../../Common_widgets/customtextfield.dart';
import 'otp_screen.dart';

/*
this is the forgotpasswordScreen this is responsible for mangement of the forgot passowrd
 */

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Row(
              children: [
                CustomAppBar(title: "Forgot Passowrd"),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Enter Your Email',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                const SizedBox(height: 20),
                CustomTextField(controller: emailController, hintText: "Email"),
                const SizedBox(
                  height: 10,
                ),
                CustomBigButton(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen()));
                }, title: "Continue"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
