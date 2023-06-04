import 'package:app_movie/camera/camera.dart';
import 'package:app_movie/onboarding/onboarding_view.dart';
import 'package:app_movie/record/recording.dart';
import 'package:app_movie/splash/recording/SuccessAnak.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Opsi extends StatefulWidget {
  const Opsi({super.key});

  @override
  State<Opsi> createState() => _OpsiState();
}

class _OpsiState extends State<Opsi> {
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
                        MaterialPageRoute(builder: (context) => Onboarding()));
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Text(
                    "Pilih Fitur",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text('---------------------------------------------',
                    style: TextStyle(fontSize: 3), textAlign: TextAlign.center),
              ),
              // Center(
              //   child: Text(
              //       'Pilih fitur dibawah ini \n Voice untuk deteksi suara, dan kamera untuk deteksi wajah',
              //       style: TextStyle(
              //         fontSize: 16,
              //       ),
              //       textAlign: TextAlign.center),
              // ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 350,
                  height: 300,
                  margin: EdgeInsets.only(left: 0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 193, 193, 193).withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/images/record.png",
                          width: 350,
                          height: 230,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 6),
                            Row(
                              children: [
                                SizedBox(width: 20),
                                Icon(
                                  Icons.record_voice_over_outlined,
                                  size: 35,
                                  color: Color.fromARGB(255, 26, 25, 25),
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "Voice",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 140),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 23, 23, 23),
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => Recording(),
                                      ),
                                    );
                                  },
                                  child: Text("GO"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 350,
                  height: 300,
                  margin: EdgeInsets.only(left: 0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 193, 193, 193).withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/images/face.png",
                          width: 350,
                          height: 230,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 6),
                            Row(
                              children: [
                                SizedBox(width: 20),
                                Icon(
                                  Icons.camera_enhance,
                                  size: 35,
                                  color: Color.fromARGB(255, 26, 25, 25),
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "Images",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 120),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 23, 23, 23),
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => Kamera(),
                                      ),
                                    );
                                  },
                                  child: Text("GO"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
