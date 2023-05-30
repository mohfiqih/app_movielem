import 'package:app_movie/dasbor/film_dewasa/HomePage.dart';
import 'package:app_movie/dasbor/film_dewasa/widgets/CustomNavBar.dart';
import 'package:app_movie/dasbor/film_dewasa/widgets/MoviePageButtons.dart';
import 'package:app_movie/dasbor/film_dewasa/widgets/RecommendWidget.dart';
import 'package:flutter/material.dart';
// import 'package:movie_app/widgets/CustomNavBar.dart';
// import 'package:movie_app/widgets/MoviePageButtons.dart';
// import 'package:movie_app/widgets/RecommendWidget.dart';

class MoviePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              "assets/images/dasbor/cover.jpg",
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePageDewasa()));
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // margin: EdgeInsets.only(left: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.brown.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/dasbor/1.jpg",
                              height: 250,
                              width: 180,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 50, top: 100),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  MoviePageButtons(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dilan 1990",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "2018  |  13+  |  1j 49m  |  Drama",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Milea (Vanesha Prescilla) bertemu dengan Dilan (Iqbaal Ramadhan) di sebuah SMA di Bandung. Itu adalah tahun 1990, saat Milea pindah dari Jakarta ke Bandung. Perkenalan yang tidak biasa kemudian membawa Milea mulai mengenal keunikan Dilan lebih jauh. Dilan yang pintar, baik hati dan romantis... semua dengan caranya sendiri. Cara Dilan mendekati Milea tidak sama dengan teman-teman lelakinya yang lain, bahkan Beni, pacar Milea di Jakarta. Bahkan cara berbicara Dilan yang terdengar kaku, lambat laun justru membuat Milea kerap merindukannya jika sehari saja ia tak mendengar suara itu. Perjalanan hubungan mereka tak selalu mulus. Beni, gank motor, tawuran, Anhar, Kang Adi, semua mewarnai perjalanan itu. Dan Dilan... dengan caranya sendiri...selalu bisa membuat Milea percaya ia bisa tiba di tujuan dengan selamat. Tujuan dari perjalanan ini. Perjalanan mereka berdua. Katanya, dunia SMA adalah dunia paling indah. Dunia Milea dan Dilan satu tingkat lebih indah daripada itu.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Pemeran: Vanesha Prescilla, Iqbaal Ramadhan, Debo Andryos, Giulio Parengkuan, Omara Esteghlal, Yoriko Angeline, Zulfa Maharani, Brandon Salim",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  RecommendWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MoviePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              "assets/images/dasbor/2.jpg",
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePageDewasa()));
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        // InkWell(
                        //   onTap: (){},
                        //   child: Icon(
                        //     Icons.favorite_border,
                        //     color: Colors.black,
                        //     size: 35,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.brown.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/dasbor/2.jpg",
                              height: 250,
                              width: 180,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 50, top: 100),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  MoviePageButtons(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ali & Ratu Ratu Queens",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "2021  |  13+  |  1j 40m  | Drama",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Ali (Iqbaal Ramadhan), remaja 17 tahun yang hendak mengejar ibu kandungnya yang meninggalkannya sejak kecil ke New York, Amerika Serikat. Sesampainya di Queens, New York, ia malah bertemu dengan ibu-ibu rempong yang kocak yaitu Party, seorang cleaning lady yang keibuan dan perhatian. Ada juga Biyah seorang bonek yang menyambi jadi paparazi, Ance seorang single mom galak dan bertingkah laku seakan dia agen rahasia, serta Chinta yang datang ke New York untuk mengejar cinta namun kandas dan berakhir menjadi seorang tukang pijat.Di tengah itu semua, Ali jatuh cinta pada Eva (Aurora Ribero), anak perempuan satu-satunya Ance yang membuatnya lebih kenal dengan keajaiban New York.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Pemeran: Iqbaal Ramadhan, Nirina Zubir, Asri Welas, Tika Panggabean, Happy Salma, Aurora Ribero, Marissa Anita, Bayu Skak, Cut Mini Theo, Ibnu Jamil",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  RecommendWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MoviePage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              "assets/images/dasbor/3.jpg",
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePageDewasa()));
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        // InkWell(
                        //   onTap: (){},
                        //   child: Icon(
                        //     Icons.favorite_border,
                        //     color: Colors.black,
                        //     size: 35,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.brown.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/dasbor/3.jpg",
                              height: 250,
                              width: 180,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 50, top: 100),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  MoviePageButtons(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dignitate",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "2020  |  13+  |  1j 46m",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Alfi adalah seorang anak SMA yang galak dan dingin. Meski disukai banyak perempuan, ia tidak punya waktu untuk pacaran. Ia sangat serius dengan pelajaran di sekolahnya. Keenan, sahabatnya, berbanding terbalik dengannya. Ia selalu menyuruh Alfi agar lebih santai. Satu hari Alfi terlambat sekolah sehingga harus membersihkan toilet perempuan. Di sana ia bertemu dengan Alana, siswi baru yang cantik di sekolah. Ternyata keduanya satu kelas dan duduk bersebelahan. Bukannya akur, mereka malah sering berdebat karena sama-sama keras kepala. Alana tidak suka dengan kepribadian Alfi yang kasar. Hal itu disebabkan oleh masa lalu Alana.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  RecommendWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MoviePage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              "assets/images/dasbor/4.jpg",
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePageDewasa()));
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        // InkWell(
                        //   onTap: (){},
                        //   child: Icon(
                        //     Icons.favorite_border,
                        //     color: Colors.black,
                        //     size: 35,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.brown.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/dasbor/4.jpg",
                              height: 250,
                              width: 180,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 50, top: 100),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  MoviePageButtons(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mariposa",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "2020  |  13+  |  1j 55m  |  Drama",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Iqbal (Angga Yunanda) seperti kupu-kupu Mariposa bagi Acha (Adhisty Zara). Tiap kali didekati ia selalu menghindar. Acha bertekad ingin mendapatkan hati Iqbal, seorang cowok cakep, pintar dan dikenal berhati dingin. Ternyata sikap dingin Iqbal itu tuntutan dari sang ayah yang menginginkannya menang dalam olimpiade sains. Amanda takut Acha akan terluka dan sakit hati. Sekali pun lugu dan polos, tekad Acha sangat kuat. Sahabat Acha, Amanda (Dannia Salsabilla), berusaha mencegah niat Acha untuk mendekati Iqbal. Acha mendekati Iqbal dengan berbagai cara. Acha yakin, jika pun hati Iqbal sekeras batu, Acha adalah air yang menetesinya setiap waktu, hingga batu itu akan pecah dan menerima dirinya. Berhasilkah Acha mendapatkan hati Iqbal?.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Pemeran: Adhisty Zara, Angga Yunanda, Dannia Salsabila, Abun Sungkar, Junior Roberts, Syakir Daulay, Ariyo Wahab, Ersa Mayori, Baim Wong, Irgi Fahrezi",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  RecommendWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class MoviePage5 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CustomNavBar(),
//       body: Stack(
//         children: [
//           Opacity(
//             opacity: 0.8,
//             child: Image.asset(
//               "assets/images/dasbor/5.jpg",
//               height: 300,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           SingleChildScrollView(
//             child: SafeArea(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Icon(
//                             Icons.arrow_back,
//                             color: Colors.white,
//                             size: 35,
//                           ),
//                         ),
//                         // InkWell(
//                         //   onTap: (){},
//                         //   child: Icon(
//                         //     Icons.favorite_border,
//                         //     color: Colors.black,
//                         //     size: 35,
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 60),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.brown.withOpacity(0.5),
//                                 spreadRadius: 1,
//                                 blurRadius: 8,
//                               ),
//                             ],
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: Image.asset(
//                               "assets/images/dasbor/5.jpg",
//                               height: 250,
//                               width: 180,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(right: 50, top: 100),
//                           height: 80,
//                           width: 80,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(40),
//                             color: Colors.red,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.red.withOpacity(0.5),
//                                 spreadRadius: 2,
//                                 blurRadius: 8,
//                               ),
//                             ],
//                           ),
//                           child: Icon(
//                             Icons.play_arrow,
//                             color: Colors.white,
//                             size: 60,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                   MoviePageButtons(),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "12 Cerita Glen Anggara",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 25,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         SizedBox(height: 15),
//                         Text(
//                           "2022  |  13+  |  1j 57m  |  Drama",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                         SizedBox(height: 15),
//                         Text(
//                           "Glen Anggara (Junior Roberts) berasal dari keluarga kaya raya, tetapi memiliki kepintaran di bawah rata-rata. Selain itu, ia memiliki semangat kebebasan, sehingga ia tidak menyukai aturan dan larangan. Bahkan, untuk mendapatkan apa yang diinginkannya, Glen akan melakukan apa saja. Namun, Glen memiliki kepribadian yang berlawanan. Bagi orang-orang di sekitarnya, Glen hanyalah anak kecil yang suka membuat kekacauan. Hingga orang-orang di sekitarnya marah padanya. Di sisi lain, Glen adalah orang yang baik dan ramah. Pada suatu hari, Glen bertemu dengan seorang gadis bernama Shena (Prilly Latuconsina). Lucunya tidak ada angin, tidak ada hujan, Shena meminta Glen menjadi kekasihnya. Tanpa pikir panjang, Glen menolak permintaan Shena yang tidak masuk akal. Glen juga menganggap bahwa Shena adalah orang yang aneh dan gila. Tentu saja, hanya di pertemuan pertama tanpa saling mengenal, Shena berani menyatakan cintanya kepada pria yang tidak dikenalnya. Pada pertemuan berikutnya, Glen secara tidak sengaja menemukan secarik kertas. Di kertas itu berisi daftar 12 keinginan Shena. Shena memiliki keinginan yang ingin dia wujudkan sebelum matahari terbenam. Setelah membacanya, Glen bingung apa sebenarnya maksud dari 12 permintaan Shena itu. Suatu hari, Glen menyadari dan mulai memahami keinginan Shena. Dia juga mengerti alasan Shena ketika dia memintanya untuk menjadi kekasihnya. Terlepas dari keraguannya, Glen menyetujui permintaan Shena. Akhirnya, keduanya memiliki kisah cinta. Glen pun berjanji pada Shena bahwa dia akan berusaha memenuhi 12 keinginan Shena.",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                           ),
//                           textAlign: TextAlign.justify,
//                         ),
//                         SizedBox(height: 15),
//                         Text(
//                           "Pemeran: Adhisty Zara, Angga Yunanda, Dannia Salsabila, Abun Sungkar, Junior Roberts, Syakir Daulay, Ariyo Wahab, Ersa Mayori, Baim Wong, Irgi Fahrezi",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                           ),
//                           textAlign: TextAlign.justify,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   RecommendWidget(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MoviePage6 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CustomNavBar(),
//       body: Stack(
//         children: [
//           Opacity(
//             opacity: 0.8,
//             child: Image.asset(
//               "assets/images/dasbor/6.jpg",
//               height: 300,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           SingleChildScrollView(
//             child: SafeArea(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Icon(
//                             Icons.arrow_back,
//                             color: Colors.white,
//                             size: 35,
//                           ),
//                         ),
//                         // InkWell(
//                         //   onTap: (){},
//                         //   child: Icon(
//                         //     Icons.favorite_border,
//                         //     color: Colors.black,
//                         //     size: 35,
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 60),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.brown.withOpacity(0.5),
//                                 spreadRadius: 1,
//                                 blurRadius: 8,
//                               ),
//                             ],
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: Image.asset(
//                               "assets/images/dasbor/6.jpg",
//                               height: 250,
//                               width: 180,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(right: 50, top: 100),
//                           height: 80,
//                           width: 80,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(40),
//                             color: Colors.red,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.red.withOpacity(0.5),
//                                 spreadRadius: 2,
//                                 blurRadius: 8,
//                               ),
//                             ],
//                           ),
//                           child: Icon(
//                             Icons.play_arrow,
//                             color: Colors.white,
//                             size: 60,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                   MoviePageButtons(),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "ILY From 38.000 FT",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 25,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         SizedBox(height: 15),
//                         Text(
//                           "2016  |  13+  |  1j 42m  |  Drama",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                         SizedBox(height: 15),
//                         Text(
//                           "ILY From 38.000 FT (I Love You From 38000 feet) bercerita tentang seorang gadis berusia 18 tahun bernama Aletta (Michelle Ziudith) yang sangat periang, berstatus jomblo, dan berjiwa petualang pergi terbang ke Bali untuk berlibur. Namun di saat yang sama Aletta bertemu dengan Arga(Rizky Nazar) seorang pria berumur 20 tahun. Arga adalah seorang mahasiswa sekaligus creator program dengan bendera Geography Channel. Di dalam pesawat, di atas ketinggian 38.000 kaki, Arga duduk di sebelah Aletta. Sejak pertemuan itu hubungan Arga dan Aletta semakin dekat dengan banyak kejadian-kejadian yang lucu diantara mereka. Suatu ketika Arga menanyakan ke Aletta berapa lama kamu akan liburan ke Bali, Aletta terdiam sesaat. Namun kemudian Aletta menjawab, sebenarnya aku ke Bali bukan untuk liburan tetapi aku kabur dari rumah. Arga dengan tenang menjawab kenapa kamu kabur? Aletta mulai nangis dan bercerita. “Dari kecil aku dibesarkan oleh orang tuaku, tumbuh dari air susu ibuku tapi saat aku besar, mereka nggak kasih hal yang paling penting dalam hidupku, yaitu hak untuk memilih dan memutuskan apa yang terbaik untuk hidup aku. Tetapi apa diusiaku sekarang aku tidak bisa mengambil keputusanku sendiri?” Hubungan mereka semakin dekat sejak saat itu dan pelan-pelan Arga meminta Aletta untuk kembali ke rumahnya. Dan Arga berjanji akan menyusulnya segera ke Jakarta. Namun hingga saat yang dijanjikan Arga tidak pernah hadir. Hari demi hari Aletta selalu menunggu kehadiran Arga tetapi tak kunjung datang.",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                           ),
//                           textAlign: TextAlign.justify,
//                         ),
//                         SizedBox(height: 15),
//                         Text(
//                           "Pemeran: Michelle Ziudith, Rizky Nazar, Tanta Ginting, Derby Romero, Ricky Cuaca, Amanda Rawles, Ayu Dyah Pasha, Aline Adita",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                           ),
//                           textAlign: TextAlign.justify,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   RecommendWidget(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
