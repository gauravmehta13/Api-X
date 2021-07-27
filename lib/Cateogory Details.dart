import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryDetails extends StatefulWidget {
  final String? category;
  // ignore: non_constant_identifier_names
  CategoryDetails({
    this.category,
  });
  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List data = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    getcategoryData();
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
      loading = false;
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0xFFFF0000),
          title: Text(widget.category!,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              )),
          centerTitle: true,
        ),
        body: loading
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    Color(0xFFFF0000),
                  ),
                ),
              )
            : Container(
                child: GridView.builder(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (2 / 1),
                  ),
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
                          showApiDetails(data[index]);
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => ApiDetails(
                          //           category:
                          //               data[index]["Category"].toString(),
                          //           api: data[index]["API"].toString(),
                          //           cors: data[index]["Cors"].toString(),
                          //           https: data[index]["HTTPS"].toString(),
                          //           description:
                          //               data[index]["Description"].toString(),
                          //           auth: data[index]["Auth"].toString(),
                          //           link: data[index]["Link"].toString(),
                          //         )));
                        },
                        padding: EdgeInsets.all(0),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(data[index]["API"],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ));
  }

  showApiDetails(data) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        builder: (context) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            elevation: 5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(data["Description"],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 3.3,
                          height: 100,
                          padding: EdgeInsets.all(5),
                          child: Card(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              elevation: 15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Https",
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      )),
                                  Text(data["HTTPS"].toString(),
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )),
                                ],
                              ))),
                      Container(
                          width: MediaQuery.of(context).size.width / 3.3,
                          height: 100,
                          padding: EdgeInsets.all(5),
                          child: Card(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              elevation: 15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Auth",
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      )),
                                  Text(
                                      data["Auth"]!.isEmpty
                                          ? "NA"
                                          : data["Auth"]!,
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )),
                                ],
                              ))),
                      Container(
                          width: MediaQuery.of(context).size.width / 3.3,
                          height: 100,
                          padding: EdgeInsets.all(5),
                          child: Card(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              elevation: 15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("CORS",
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      )),
                                  Text(data["Cors"],
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )),
                                ],
                              ))),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    onPressed: () {
                      launch(data["Link"]);
                    },
                    color: Color(0xFFFF0000),
                    child: Text('Access API',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
