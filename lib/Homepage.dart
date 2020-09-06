import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Cateogory Details.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;
  final String url = "https://api.publicapis.org/categories";
  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Future<String> getData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    // var data = response.body;
    print(response.body);
    setState(() {
      data = json.decode(response.body);
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFF0000),
          title: Text(
            'Api X',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: GridView.builder(
            itemCount: data == null ? 0 : data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (2 / 1),
            ),
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.all(10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                elevation: 5,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoryDetails(
                              category: data[index].toString(),
                            )));
                    print(data[index].toString());
                  },
                  padding: EdgeInsets.all(0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: Text(data[index],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
