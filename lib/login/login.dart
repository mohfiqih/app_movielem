import 'dart:convert';

import 'package:app_movie/dasbor/notif.dart';
import 'package:app_movie/login/controller_login.dart';
import 'package:app_movie/otp/otp.dart';
import 'package:app_movie/register/register.dart';
import 'package:app_movie/welcome/welcome.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_auth/email_auth.dart';
// import 'package:email_otp/email_otp.dart';
// import '../otp/email_otp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String? email, password;

  final _formState = GlobalKey<FormState>();

  EmailOTP myauth = EmailOTP();

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
              height: 40,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Welcome()));
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 32,
                  color: Colors.black54,
                ),
              ),
            ),
            Form(
              key: _formState,
              child: Column(children: [
                // const SizedBox(
                //   height: 50,
                // ),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 10,
                      child: SvgPicture.asset(
                        "assets/images/log/log.svg",
                        height: 230,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'Login Account',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Silahkan login akun terlebih dahulu!",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    child: Text(
                      "Email Address",
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
                            obscureText: false,
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                            // controller: textControllerEmail,
                            validator: ((value) {
                              if (value == '') {
                                return "Mohon isi terlebih dahulu!";
                              }
                            }),
                            decoration: InputDecoration(
                              icon: new Icon(Icons.email),
                              border: InputBorder.none,
                              hintText: 'Masukan Email..',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 20),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                //   child: Container(
                //     child: Text(
                //       "Nomor Telepon",
                //       style: TextStyle(
                //         fontSize: 17,
                //         color: Colors.black,
                //       ),
                //     ),
                //     alignment: Alignment.centerLeft,
                //   ),
                // ),
                // SizedBox(height: 10),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //   child: Container(
                //     padding: const EdgeInsets.all(7),
                //     decoration: BoxDecoration(
                //       color: Colors.grey[200],
                //       border: Border.all(color: Colors.white),
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: Padding(
                //       padding: EdgeInsets.only(left: 20.0),
                //       child: Column(
                //         children: [
                //           TextFormField(
                //             textInputAction: TextInputAction.done,
                //             obscureText: false,
                //             onChanged: (value) {
                //               setState(() {
                //                 telp = value;
                //               });
                //             },
                //             // controller: textControllerEmail,
                //             validator: ((value) {
                //               if (value == '') {
                //                 return "Mohon isi terlebih dahulu!";
                //               }
                //             }),
                //             decoration: InputDecoration(
                //               icon: new Icon(Icons.phone),
                //               border: InputBorder.none,
                //               hintText: 'Masukan Nomor..',
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    child: Text(
                      "Password",
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
                              hintText: 'Masukan Password..',
                            ),
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
                      print("Validation Success");
                      print("email : " + email!);
                      print("password : " + password!);
                      await HttpService.flutter_login(email, password, context);
                      // sendMail();
                      // await HttpService.sendMail();

                      // myauth.setConfig(
                      //   appEmail: "me@rohitchouhan.com",
                      //   appName: "Email OTP",
                      //   userEmail: email,
                      //   // otpType: json,
                      //   // otpLength: 6,
                      //   // otpType: OTPType.stringOnly,
                      // );
                      // if (await myauth.sendOTP() == true) {
                      //   print("OTP berhasil dikirim, cek email!");
                      //   //   // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //   //   //   content: Text("OTP berhasil dikirim, cek email!"),
                      //   //   // ));
                      // } else {
                      //   print("Oops, OTP gagal dikirim, masukan email dulu!");
                      //   //   // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //   //   //   content: Text(
                      //   //   //       "Oops, OTP gagal dikirim, masukan email dulu!"),
                      //   //   // ));
                      // }
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
                        SizedBox(width: 130),
                        Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        SizedBox(width: 100),
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun?',
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 120, 167),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => RegisterView()));
                      },
                    ),
                  ],
                ),
              ]),
            )
          ],
        )),
      ),
    );
  }
}
