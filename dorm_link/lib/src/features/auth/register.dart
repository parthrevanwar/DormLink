import 'package:dorm_link/main.dart';
import 'package:dorm_link/src/Common_widgets/custom_form_text_field.dart';
import 'package:dorm_link/src/Common_widgets/custombigbutton.dart';
import 'package:dorm_link/src/features/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_up_failure.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final _formKey = GlobalKey<FormState>();
  String _enteredName = "";
  String _enteredEmail = "";
  String _enteredEnrollmentNum = "";
  String _enteredPassword = "";

  Future registerUser() async {
    try {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);

        //Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              icon: Icon(Icons.error_outline),
              iconColor: Colors.redAccent,
              title: Text(
                SignupWithEmailAndPasswordFailure.code(e.code).message,
                style: GoogleFonts.poppins(color: Colors.redAccent),
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 90),

                // logo
                // const Icon(
                //   Icons.lock,
                //   size: 100,
                // ),
                Text(
                  'Register',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 60,
                      color: Theme.of(context).colorScheme.onBackground),
                ),

                const SizedBox(height: 40),

                // welcome back, you've been missed!
                Text(
                  'Enter your details and Join the community',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.length <= 1) {
                        return "Name must not be empty";
                      }
                      return null;
                    },
                    hintText: "Name",
                    enteredValue: _enteredName),

                const SizedBox(height: 8),

                CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.length <= 1) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                    hintText: "Email ID",
                    enteredValue: _enteredEmail),

                const SizedBox(height: 8),
                CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.length != 10) {
                        return "Enrollment No. is not valid";
                      }
                      return null;
                    },
                    hintText: "Enrollment No.",
                    enteredValue: _enteredEnrollmentNum),

                const SizedBox(height: 8),
                CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.length < 8) {
                        return "Password should be of atleast 8 characters";
                      }
                      return null;
                    },
                    hintText: "Password",
                    enteredValue: _enteredPassword, isPassword: true,),

                const SizedBox(height: 8),

                const SizedBox(height: 25),

                // sign in button
                CustomBigButton(
                  onTap: registerUser,
                  title: "Register",
                ),
                const SizedBox(
                  height: 24,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginPage()));
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
