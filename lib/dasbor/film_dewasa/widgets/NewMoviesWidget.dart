import 'package:app_movie/dasbor/film_dewasa/pages/MoviePage.dart';
import 'package:app_movie/dasbor/film_dewasa/widgets/SeeAllNew.dart';
import 'package:flutter/material.dart';

class NewMoviesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Movies",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SeeAllNew()));
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    color: Color(0xFF6A1B9A),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // for(int i=1; i<21; i++)
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, "moviePage1");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MoviePage1()));
                },
                child: Container(
                  width: 190,
                  height: 300,
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Color(0xFF292B37).withOpacity(0.5),
                    //     spreadRadius: 2,
                    //     blurRadius: 6,
                    //   ),
                    // ],
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
                          "assets/images/dasbor/1.jpg",
                          height: 205,
                          width: 205,
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
                            Text(
                              "Dilan 1990",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Roman/Drama",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "8.5",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                  ),
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

              // InkWell(
              //   onTap: () {
              //     // Navigator.pushNamed(context, "moviePage2");
              //     Navigator.pushReplacement(context,
              //         MaterialPageRoute(builder: (context) => MoviePage2()));
              //   },
              //   child: Container(
              //     width: 190,
              //     height: 300,
              //     margin: EdgeInsets.only(left: 20),
              //     decoration: BoxDecoration(
              //       color: Color(0xFFFFFFFF),
              //       borderRadius: BorderRadius.circular(10),
              //       // boxShadow: [
              //       //   BoxShadow(
              //       //     color: Color(0xFF292B37).withOpacity(0.5),
              //       //     spreadRadius: 2,
              //       //     blurRadius: 6,
              //       //   ),
              //       // ],
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         ClipRRect(
              //           borderRadius: BorderRadius.only(
              //             topLeft: Radius.circular(10),
              //             topRight: Radius.circular(10),
              //           ),
              //           child: Image.asset(
              //             "assets/images/dasbor/2.jpg",
              //             height: 205,
              //             width: 205,
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.symmetric(
              //             vertical: 8,
              //             horizontal: 5,
              //           ),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 "Ali & Ratu Ratu Queens",
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 17,
              //                   fontWeight: FontWeight.w500,
              //                 ),
              //               ),
              //               SizedBox(height: 6),
              //               Text(
              //                 "Drama/Komedi",
              //                 style: TextStyle(
              //                   color: Colors.black54,
              //                 ),
              //               ),
              //               SizedBox(height: 6),
              //               Row(
              //                 children: [
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.amber,
              //                   ),
              //                   SizedBox(width: 5),
              //                   Text(
              //                     "8.8",
              //                     style: TextStyle(
              //                       color: Colors.black54,
              //                       fontSize: 15,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // InkWell(
              //   onTap: () {
              //     // Navigator.pushNamed(context, "moviePage3");
              //     Navigator.pushReplacement(context,
              //         MaterialPageRoute(builder: (context) => MoviePage3()));
              //   },
              //   child: Container(
              //     width: 190,
              //     height: 300,
              //     margin: EdgeInsets.only(left: 20),
              //     decoration: BoxDecoration(
              //       color: Color(0xFFFFFFFF),
              //       borderRadius: BorderRadius.circular(10),
              //       // boxShadow: [
              //       //   BoxShadow(
              //       //     color: Color(0xFF292B37).withOpacity(0.5),
              //       //     spreadRadius: 2,
              //       //     blurRadius: 6,
              //       //   ),
              //       // ],
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         ClipRRect(
              //           borderRadius: BorderRadius.only(
              //             topLeft: Radius.circular(10),
              //             topRight: Radius.circular(10),
              //           ),
              //           child: Image.asset(
              //             "assets/images/dasbor/3.jpg",
              //             height: 205,
              //             width: 205,
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.symmetric(
              //             vertical: 8,
              //             horizontal: 5,
              //           ),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 "Dignitate",
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 17,
              //                   fontWeight: FontWeight.w500,
              //                 ),
              //               ),
              //               SizedBox(height: 6),
              //               Text(
              //                 "Drama/Roman",
              //                 style: TextStyle(
              //                   color: Colors.black54,
              //                 ),
              //               ),
              //               SizedBox(height: 6),
              //               Row(
              //                 children: [
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.amber,
              //                   ),
              //                   SizedBox(width: 5),
              //                   Text(
              //                     "8.8",
              //                     style: TextStyle(
              //                       color: Colors.black54,
              //                       fontSize: 15,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // InkWell(
              //   onTap: () {
              //     // Navigator.pushNamed(context, "moviePage4");
              //     Navigator.pushReplacement(context,
              //         MaterialPageRoute(builder: (context) => MoviePage4()));
              //   },
              //   child: Container(
              //     width: 190,
              //     height: 300,
              //     margin: EdgeInsets.only(left: 20),
              //     decoration: BoxDecoration(
              //       color: Color(0xFFFFFFFF),
              //       borderRadius: BorderRadius.circular(10),
              //       // boxShadow: [
              //       //   BoxShadow(
              //       //     color: Color(0xFF292B37).withOpacity(0.5),
              //       //     spreadRadius: 2,
              //       //     blurRadius: 6,
              //       //   ),
              //       // ],
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         ClipRRect(
              //           borderRadius: BorderRadius.only(
              //             topLeft: Radius.circular(10),
              //             topRight: Radius.circular(10),
              //           ),
              //           child: Image.asset(
              //             "assets/images/dasbor/4.jpg",
              //             height: 205,
              //             width: 205,
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.symmetric(
              //             vertical: 8,
              //             horizontal: 5,
              //           ),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 "Mariposa",
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 17,
              //                   fontWeight: FontWeight.w500,
              //                 ),
              //               ),
              //               SizedBox(height: 6),
              //               Text(
              //                 "Drama/Roman",
              //                 style: TextStyle(
              //                   color: Colors.black54,
              //                 ),
              //               ),
              //               SizedBox(height: 6),
              //               Row(
              //                 children: [
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.amber,
              //                   ),
              //                   SizedBox(width: 5),
              //                   Text(
              //                     "8.8",
              //                     style: TextStyle(
              //                       color: Colors.black54,
              //                       fontSize: 15,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // InkWell(
              //   onTap: () {
              //     Navigator.pushNamed(context, "moviePage5");
              //   },
              //   child: Container(
              //     width: 190,
              //     height: 300,
              //     margin: EdgeInsets.only(left: 20),
              //     decoration: BoxDecoration(
              //       color: Color(0xFFFFFFFF),
              //       borderRadius: BorderRadius.circular(10),
              //       // boxShadow: [
              //       //   BoxShadow(
              //       //     color: Color(0xFF292B37).withOpacity(0.5),
              //       //     spreadRadius: 2,
              //       //     blurRadius: 6,
              //       //   ),
              //       // ],
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         ClipRRect(
              //           borderRadius: BorderRadius.only(
              //             topLeft: Radius.circular(10),
              //             topRight: Radius.circular(10),
              //           ),
              //           child: Image.asset(
              //             "assets/images/dasbor/5.jpg",
              //             height: 205,
              //             width: 220,
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.symmetric(
              //             vertical: 8,
              //             horizontal: 5,
              //           ),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 "12 Cerita Glen Anggara",
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 17,
              //                   fontWeight: FontWeight.w500,
              //                 ),
              //               ),
              //               SizedBox(height: 6),
              //               Text(
              //                 "Drama/Roman",
              //                 style: TextStyle(
              //                   color: Colors.black54,
              //                 ),
              //               ),
              //               SizedBox(height: 6),
              //               Row(
              //                 children: [
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.amber,
              //                   ),
              //                   SizedBox(width: 5),
              //                   Text(
              //                     "8.8",
              //                     style: TextStyle(
              //                       color: Colors.black54,
              //                       fontSize: 15,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // InkWell(
              //   onTap: () {
              //     Navigator.pushNamed(context, "moviePage6");
              //   },
              //   child: Container(
              //     width: 190,
              //     height: 300,
              //     margin: EdgeInsets.only(left: 20),
              //     decoration: BoxDecoration(
              //       color: Color(0xFFFFFFFF),
              //       borderRadius: BorderRadius.circular(10),
              //       // boxShadow: [
              //       //   BoxShadow(
              //       //     color: Color(0xFF292B37).withOpacity(0.5),
              //       //     spreadRadius: 2,
              //       //     blurRadius: 6,
              //       //   ),
              //       // ],
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         ClipRRect(
              //           borderRadius: BorderRadius.only(
              //             topLeft: Radius.circular(10),
              //             topRight: Radius.circular(10),
              //           ),
              //           child: Image.asset(
              //             "assets/images/dasbor/6.jpg",
              //             height: 205,
              //             width: 205,
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.symmetric(
              //             vertical: 8,
              //             horizontal: 5,
              //           ),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 "ILY From 38.000 FT",
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 17,
              //                   fontWeight: FontWeight.w500,
              //                 ),
              //               ),
              //               SizedBox(height: 6),
              //               Text(
              //                 "Drama/Roman",
              //                 style: TextStyle(
              //                   color: Colors.black54,
              //                 ),
              //               ),
              //               SizedBox(height: 6),
              //               Row(
              //                 children: [
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.amber,
              //                   ),
              //                   SizedBox(width: 5),
              //                   Text(
              //                     "8.0",
              //                     style: TextStyle(
              //                       color: Colors.black54,
              //                       fontSize: 15,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
