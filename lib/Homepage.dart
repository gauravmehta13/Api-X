import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'Cateogory Details.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  late SearchBar searchBar;
  HomePageState() {
    searchBar = new SearchBar(
        inBar: false,
        showClearButton: false,
        onChanged: (e) {
          setState(() {
            filteredData = (data)
                .where((u) => (u.toLowerCase().contains(e.toLowerCase())))
                .toList();
          });
        },
        onCleared: () {
          setState(() {
            filteredData = data;
          });
        },
        setState: setState,
        onSubmitted: print,
        buildDefaultAppBar: buildAppBar);
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFF0000),
      title: Text('Api X',
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          )),
      centerTitle: true,
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 10),
            child:
                SizedBox(height: 35, child: searchBar.getSearchAction(context)))
      ],
    );
  }

  List data = [];
  List filteredData = [];
  final String url = "https://api.publicapis.org/categories";
  @override
  void initState() {
    super.initState();
    getData();
  }

  bool loading = true;

  Future<String> getData() async {
    var response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    print(response.body);
    setState(() {
      data = json.decode(response.body);
      filteredData = data;
      loading = false;
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        appBar: searchBar.build(context),
        body: loading
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    Color(0xFFFF0000),
                  ),
                ),
              )
            : GridView.builder(
                itemCount: filteredData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                ),
                padding: EdgeInsets.only(top: 10),
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.all(5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    elevation: 5,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CategoryDetails(
                                  category: filteredData[index].toString(),
                                )));
                        print(filteredData[index].toString());
                      },
                      padding: EdgeInsets.all(0),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(filteredData[index],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            )),
                      ),
                    ),
                  ),
                ),
              ));
  }
}
