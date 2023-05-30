import 'package:app_movie/dasbor/film_dewasa/widgets/CustomNavBar.dart';
import 'package:app_movie/dasbor/film_dewasa/widgets/NewMoviesWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SeeAllNew extends StatefulWidget {
  const SeeAllNew({super.key});

  @override
  State<SeeAllNew> createState() => _SeeAllNewState();
}

class _SeeAllNewState extends State<SeeAllNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80),
              NewMoviesWidget(),
              SizedBox(height: 30),
              NewMoviesWidget(),
              SizedBox(height: 30),
              NewMoviesWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
