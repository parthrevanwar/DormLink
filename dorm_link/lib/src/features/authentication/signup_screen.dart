import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../Common_widgets/customappbar.dart';
import '../../Common_widgets/customtextfield.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                CustomAppBar(title: "Sign Up"),
              ],
            ),
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
                      const Text('Create Account',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 20),
                      CustomTextField(
                          controller: nameController, hintText: "Your Name"),
                      const SizedBox(height: 10),
                      CustomTextField(
                          controller: emailController, hintText: "Your Email"),
                      const SizedBox(height: 10),
                      CustomTextField(
                          controller: phoneController,
                          hintText: "Your Phone No."),
                      const SizedBox(height: 10),
                      CustomTextField(
                          controller: passwordController, hintText: "Password"),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4A9DFF),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          child: const Text('Continue',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
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
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have account? ',
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
                                            LoginScreen()));
                              });
                            },
                            child: const Text('Log In',
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
