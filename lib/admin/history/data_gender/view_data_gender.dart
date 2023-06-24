import 'package:app_movie/admin/history/data_gender/service_gender.dart';
import 'package:app_movie/admin/history/data_gender/model_gender.dart';
import 'package:app_movie/admin/history/data_gender/service_gender.dart';
import 'package:app_movie/admin/navbar_admin.dart';
import 'package:flutter/material.dart';

class DataGenderBaru extends StatefulWidget {
  @override
  State<DataGenderBaru> createState() => _DataGenderBaruState();
}

class _DataGenderBaruState extends State<DataGenderBaru> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  late List<Gender> gender;
  var isLoaded = false;
  ScrollController? _scrollController;
  int currentPage = 1;
  int pageSize = 10;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getRecord();
    _scrollController = ScrollController();
    _scrollController!.addListener(_scrollListener);
  }

  Future<void> getRecord() async {
    gender =
        await GenderApi().getAllGender(page: currentPage, pageSize: pageSize);
    if (gender != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  void _scrollListener() {
    if (_scrollController!.offset >=
            _scrollController!.position.maxScrollExtent &&
        !_scrollController!.position.outOfRange) {
      if (!isLoading) {
        setState(() {
          currentPage++;
          isLoading = true;
        });
        loadMoreData();
      }
    }
  }

  Future<void> loadMoreData() async {
    List<Gender> newGender =
        await GenderApi().getAllGender(page: currentPage, pageSize: pageSize);
    setState(() {
      gender.addAll(newGender);
      isLoading = false;
    });
  }

  void _scrollLeft() {
    _scrollController!.animateTo(
      _scrollController!.offset - 200,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollRight() {
    _scrollController!.animateTo(
      _scrollController!.offset + 200,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Users',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(255, 0, 71, 202),
        toolbarHeight: 60,
      ),
      body: FutureBuilder<List<Gender>>(
        future: GenderApi().getAllGender(page: currentPage, pageSize: pageSize),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Gender> user = snapshot.data ?? [];
            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text('Waktu Awal'),
                      ),
                      DataColumn(
                        label: Text('Waktu Akhir'),
                      ),
                      DataColumn(
                        label: Text('Jumlah'),
                      ),
                      DataColumn(
                        label: Text('Kategori'),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      user.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(
                            Text(user[index].jenis_kelamin),
                          ),
                          DataCell(
                            Text(user[index].rentang_umur),
                          ),
                          DataCell(
                            Text(user[index].label),
                          ),
                          DataCell(
                            Text(user[index].date_created),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _scrollLeft,
                      child: Icon(Icons.arrow_back_ios),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 0, 71, 202),
                      ),
                    ),
                    SizedBox(width: 250),
                    ElevatedButton(
                      onPressed: _scrollRight,
                      child: Icon(Icons.arrow_forward_ios),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 0, 71, 202),
                      ),
                    ),
                  ],
                ),
                if (isLoading) CircularProgressIndicator(),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: NavbarAdmin(),
    );
  }
}
