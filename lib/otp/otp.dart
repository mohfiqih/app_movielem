import 'package:app_movie/login/login.dart';
import 'package:app_movie/record/record.dart';
import 'package:app_movie/register/register.dart';
import 'package:app_movie/splash/onGoing.dart';
// import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_auth/email_auth.dart';
import 'package:email_otp/email_otp.dart';
import 'package:app_movie/otp/email_otp.dart';

import 'package:app_movie/otp/cek_otp.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

import '../login/controller_login.dart';

class OTP extends StatefulWidget {
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  late String? token, email, password;
  final _formState = GlobalKey<FormState>();

  final _formStateResend = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: SingleChildScrollView(
          // padding: EdgeInsets.symmetric(horizontal: 32, vertical: 50),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 10,
                    child: SvgPicture.asset(
                      "assets/images/verify.svg",
                      height: 220,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Verification Token',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter your OTP code number",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 28,
              ),
              SizedBox(height: 10),
              Form(
                key: _formState,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        child: Text(
                          "Re-Email",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Column(
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                // keyboardType: TextInputType.number,
                                obscureText: false,
                                // controller: otpController,
                                decoration: InputDecoration(
                                  icon: new Icon(Icons.email),
                                  border: InputBorder.none,
                                  hintText: 'Masukan Ulang Email',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                                validator: ((value) {
                                  if (value == '') {
                                    return "Masukan Email terlebih dahulu!";
                                  }
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        child: Text(
                          "Verify Token",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Column(
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                // keyboardType: TextInputType.number,
                                obscureText: false,
                                // controller: otpController,
                                decoration: InputDecoration(
                                  icon: new Icon(Icons.key),
                                  border: InputBorder.none,
                                  hintText: 'Masukan Kode Token',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    token = value;
                                  });
                                },
                                validator: ((value) {
                                  if (value == '') {
                                    return "Masukan Token terlebih dahulu!";
                                  }
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () async {
                        if (_formState.currentState!.validate()) {
                          // print("Validation Success");
                          print("email : " + email!);
                          print("token : " + token!);
                          await Cek_otp.flutter_token(email, token, context);
                        } else {
                          print("Validation Error");
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 110),
                            Text(
                              "Send Token",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            SizedBox(width: 80),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 25,
                            )
                          ],
                        ),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 120, 167),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: Text(
                  "Resend Token",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 120, 167),
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        scrollable: true,
                        title: Text('Resend Token'),
                        content: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Form(
                            key: _formStateResend,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: Container(
                                    child: Text(
                                      "Masukan email login anda saat ini, untuk resend Token Login!",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: Container(
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            textInputAction:
                                                TextInputAction.done,
                                            obscureText: false,
                                            onChanged: (value) {
                                              setState(() {
                                                email = value;
                                              });
                                            },
                                            validator: ((value) {
                                              if (value == '') {
                                                return "Mohon isi terlebih dahulu!";
                                              }
                                            }),
                                            decoration: InputDecoration(
                                              icon: new Icon(Icons.email),
                                              border: InputBorder.none,
                                              hintText: 'Masukan Email',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: Container(
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            textInputAction:
                                                TextInputAction.done,
                                            obscureText: true,
                                            onChanged: (value) {
                                              setState(() {
                                                password = value;
                                              });
                                            },
                                            validator: ((value) {
                                              if (value == '') {
                                                return "Mohon isi terlebih dahulu!";
                                              }
                                            }),
                                            decoration: InputDecoration(
                                              icon: new Icon(Icons.password),
                                              border: InputBorder.none,
                                              hintText: 'Masukan Password',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (_formStateResend.currentState!
                                        .validate()) {
                                      print("Validation Success");
                                      print("email : " + email!);
                                      print("password : " + password!);
                                      await Resend.flutter_login(
                                          email, password, context);
                                    } else {
                                      print("Validation Error");
                                    }
                                  },
                                  child: Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(width: 30),
                                        Text(
                                          "Resend Token",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 17),
                                        ),
                                        SizedBox(width: 90),
                                        Icon(
                                          Icons.update,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      ],
                                    ),
                                    height: 60,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 0, 120, 167),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
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
          ),
        ),
      ),
    );
  }
}
