import 'package:app_movie/admin/analisis/analisis.dart';
import 'package:app_movie/admin/chart/chart.dart';
import 'package:app_movie/admin/history/data/data_admin.dart';
import 'package:app_movie/admin/history/data/data_gender.dart';
import 'package:app_movie/admin/navbar_admin.dart';
import 'package:app_movie/onboarding/onboarding_view.dart';
import 'package:app_movie/settings/settings_admin.dart';
import 'package:app_movie/splash/wait.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// class Admin extends StatelessWidget {

// }

class HalamanAdmin extends StatefulWidget {
  const HalamanAdmin({super.key});

  @override
  State<HalamanAdmin> createState() => _HalamanAdminState();
}

class _HalamanAdminState extends State<HalamanAdmin> {
  var email = 'mohfiqiherinsyah@gmail.com';
  var nama = 'Moh. Fiqih Erinsyah';
  var level = 'User';

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      body: Container(
        margin: const EdgeInsets.only(top: 60),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hai, Admin!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Dashboard Administrator",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                child: Icon(
                                  Icons.settings,
                                  color: Color.fromARGB(255, 99, 99, 99),
                                  size: 30,
                                ),
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => SettingsPageAdmin(),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.notifications,
                                color: Color.fromARGB(255, 99, 99, 99),
                                size: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                child: Icon(
                                  Icons.people_alt_outlined,
                                  color: Color.fromARGB(255, 99, 99, 99),
                                  size: 30,
                                ),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        scrollable: true,
                                        title: Text('Profil'),
                                        content: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Form(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 0),
                                                  child: Container(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      0),
                                                          child: Container(
                                                            child: Text(
                                                              "Berikut data akun anda, jika ingin logout klik tombol logout!",
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            alignment: Alignment
                                                                .centerLeft,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 30,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      0),
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(7),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[200],
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .white),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 10),
                                                              child: Column(
                                                                children: [
                                                                  TextFormField(
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .done,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      icon: new Icon(
                                                                          Icons
                                                                              .people),
                                                                      border: InputBorder
                                                                          .none,
                                                                      hintText:
                                                                          '$nama',
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
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      0),
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(7),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[200],
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .white),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 10),
                                                              child: Column(
                                                                children: [
                                                                  TextFormField(
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .done,
                                                                    obscureText:
                                                                        true,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      icon: new Icon(
                                                                          Icons
                                                                              .email),
                                                                      border: InputBorder
                                                                          .none,
                                                                      hintText:
                                                                          '$email',
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
                                                            // Navigator.of(
                                                            //         context)
                                                            //     .pushReplacement(
                                                            //         MaterialPageRoute(
                                                            //             builder:
                                                            //                 (context) =>
                                                            //                     Wait()));
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  scrollable:
                                                                      true,
                                                                  // title: Text(
                                                                  //     'Profil'),
                                                                  content:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(2),
                                                                    child: Form(
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(horizontal: 0),
                                                                            child:
                                                                                Container(
                                                                              child: Column(
                                                                                children: [
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  Text(
                                                                                    "Yakin Logout?",
                                                                                    style: TextStyle(
                                                                                      fontSize: 15,
                                                                                      color: Colors.black,
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 20,
                                                                                  ),
                                                                                  InkWell(
                                                                                    onTap: () async {
                                                                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Wait()));
                                                                                    },
                                                                                    child: Container(
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          SizedBox(width: 30),
                                                                                          Text(
                                                                                            "Ya",
                                                                                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17),
                                                                                          ),
                                                                                          SizedBox(width: 140),
                                                                                          Icon(
                                                                                            Icons.done_all_outlined,
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
                                                                                  SizedBox(
                                                                                    height: 20,
                                                                                  ),
                                                                                  InkWell(
                                                                                    onTap: () async {
                                                                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HalamanAdmin()));
                                                                                    },
                                                                                    child: Container(
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          SizedBox(width: 30),
                                                                                          Text(
                                                                                            "Tidak",
                                                                                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17),
                                                                                          ),
                                                                                          SizedBox(width: 110),
                                                                                          Icon(
                                                                                            Icons.backspace_sharp,
                                                                                            color: Colors.white,
                                                                                            size: 25,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      height: 60,
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color.fromARGB(255, 232, 0, 0),
                                                                                        borderRadius: BorderRadius.circular(15),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              // child: Text(
                                                                              //   "Masukan email login anda saat ini, untuk resend Token Login!",
                                                                              //   style: TextStyle(
                                                                              //     fontSize: 15,
                                                                              //     color: Colors.black,
                                                                              //   ),
                                                                              // ),
                                                                              // alignment: Alignment.centerLeft,
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
                                                          child: Container(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                SizedBox(
                                                                    width: 30),
                                                                Icon(
                                                                  Icons.logout,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 25,
                                                                ),
                                                                SizedBox(
                                                                    width: 60),
                                                                Text(
                                                                  "Logout",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          17),
                                                                ),
                                                              ],
                                                            ),
                                                            height: 60,
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      0,
                                                                      120,
                                                                      167),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
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
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 227, 227),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 99, 99, 99),
                      size: 30,
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 280,
                      margin: EdgeInsets.only(left: 5),
                      child: TextFormField(
                        style:
                            TextStyle(color: Color.fromARGB(255, 0, 120, 167)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Movielas..",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 158, 158, 158)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "assets/images/dasbor/dasbor.png",
                          height: 220,
                          width: 370,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => DataAdmin()));
                      },
                      child: Container(
                        width: 110,
                        height: 110,
                        margin: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 120, 167),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 150, 150, 150)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Icon(
                                          Icons.admin_panel_settings,
                                          size: 30,
                                          color: Color.fromARGB(
                                              255, 254, 254, 254),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Data Users",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 241, 241, 241),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Chart()));
                      },
                      child: Container(
                        width: 110,
                        height: 110,
                        margin: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 120, 167),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 150, 150, 150)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Icon(
                                          Icons.align_vertical_bottom_outlined,
                                          size: 28,
                                          color: Color.fromARGB(
                                              255, 254, 254, 254),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Grafik",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 241, 241, 241),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DataGender()));
                      },
                      child: Container(
                        width: 110,
                        height: 110,
                        margin: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 120, 167),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 150, 150, 150)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Icon(
                                          Icons.people,
                                          size: 28,
                                          color: Color.fromARGB(
                                              255, 254, 254, 254),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Data Gender",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
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
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Analisis()));
                },
                child: Container(
                  width: 360,
                  height: 90,
                  margin: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 120, 167),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 150, 150, 150).withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.add_chart_outlined,
                                    size: 28,
                                    color: Color.fromARGB(255, 254, 254, 254),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Lihat Total Data",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavbarAdmin(),
    );
  }
}
