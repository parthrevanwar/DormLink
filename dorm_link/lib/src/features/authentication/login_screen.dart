import 'package:dorm_link/src/Common_widgets/customappbar.dart';
import 'package:dorm_link/src/Common_widgets/custombigbutton.dart';
import 'package:dorm_link/src/Common_widgets/customtextfield.dart';
import 'package:dorm_link/src/features/authentication/forgotpassword_screen.dart';
import 'package:dorm_link/src/features/authentication/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../../main.dart';
/*
this is the screen responsible for handling of the login actvity

this page also conatins the code of the sign in activity to oo
 */

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: CustomAppBar(title: "Sign In"),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      const Text('Welcome back',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 20),
                      CustomTextField(
                          controller: emailController, hintText: "Your Email"),
                      const SizedBox(height: 10),
                      CustomTextField(
                          controller: passwordController,
                          hintText: "Password here"),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ForgotPasswordScreen()));
                              });
                            },
                            child: const Text('Forgot Password',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF4A9DFF),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      CustomBigButton(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                      }, title: "Conitnue"),
                      const SizedBox(height: 10),
                      Text(
                        'or continue with',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 10),
                      SocialLoginButton(
                          buttonType: SocialLoginButtonType.google,
                          backgroundColor: Color.fromARGB(255, 241, 250, 255),
                          borderRadius: 20,
                          onPressed: () {}),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New User? ',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SignUpScreen()));
                              });
                            },
                            child: const Text('Create Account',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF4A9DFF),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
