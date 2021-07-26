import 'dart:convert';
import 'package:PublicApi/Api%20details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CategoryDetails extends StatefulWidget {
  String? category;
  // ignore: non_constant_identifier_names
  CategoryDetails({
    this.category,
  });
  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List? data;
  @override
  void initState() {
    super.initState();

    this.getcategoryData();
  }

  Future<String> getcategoryData() async {
    var category1;
    setState(() {
      category1 = widget.category;
    });
    var response = await http.get(
        Uri.parse(
            "https://api.publicapis.org/entries?category=$category1&https=true"),
        headers: {"Accept": "application/json"});
    print(widget.category);
    setState(() {
      var convertdata = json.decode(response.body);
      data = convertdata['entries'];
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFF0000),
          title: Text(
            widget.category!,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.black,
          child: GridView.builder(
            itemCount: data == null ? 0 : data!.length,
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
                        builder: (context) => ApiDetails(
                              category: data![index]["Category"].toString(),
                              api: data![index]["API"].toString(),
                              cors: data![index]["Cors"].toString(),
                              https: data![index]["HTTPS"].toString(),
                              description:
                                  data![index]["Description"].toString(),
                              auth: data![index]["Auth"].toString(),
                              link: data![index]["Link"].toString(),
                            )));
                  },
                  padding: EdgeInsets.all(0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: Text(data![index]['API'].toString(),
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
