import 'package:app_movie/login/login.dart';
import 'package:app_movie/onboarding/onboarding_view.dart';
import 'package:app_movie/reset/reset.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'dart:convert';

import 'package:app_movie/login/controller_login.dart';
import 'package:app_movie/otp/otp.dart';
import 'package:app_movie/register/register.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_auth/email_auth.dart';
// import 'package:email_otp/email_otp.dart';
// import '../otp/email_otp.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Onboarding()));
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              Form(
                // key: _formState,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hi, Movielas! Kami hadir untuk anda, menemani hari bahagia anda! Enjoy your life.",
                      style: TextStyle(
                        fontSize: 1,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hi, Movielas! Kami hadir untuk anda, menemani hari bahagia anda! Enjoy your life.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 90),
                    Row(
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 10,
                          child: SvgPicture.asset(
                            "assets/images/welcm.svg",
                            height: 270,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    SizedBox(height: 70),
                    InkWell(
                      onTap: () async {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 140),
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 120, 167),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () async {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => RegisterView()));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 130),
                            Text(
                              "Register",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 211, 240, 252),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Anda lupa password?',
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 120, 167),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Reset()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
