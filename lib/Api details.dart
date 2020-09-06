import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApiDetails extends StatelessWidget {
  @override
  String api;
  String description;
  String auth;
  String https;
  String cors;
  String link;
  String category;

  ApiDetails(
      {this.https,
      this.description,
      this.api,
      this.auth,
      this.category,
      this.cors,
      this.link});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                elevation: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    children: [
                      Text(api,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          )),
                      SizedBox(
                        height: 25,
                      ),
                      Text(description,
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
                              width: 150,
                              height: 100,
                              padding: EdgeInsets.all(10),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  elevation: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Https",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          )),
                                      Text(https,
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          )),
                                    ],
                                  ))),
                          Container(
                              width: 150,
                              height: 100,
                              padding: EdgeInsets.all(10),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  elevation: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Auth",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          )),
                                      Text(auth,
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          )),
                                    ],
                                  ))),
                          Container(
                              width: 150,
                              height: 100,
                              padding: EdgeInsets.all(10),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  elevation: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("CORS",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          )),
                                      Text(cors,
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
                      RaisedButton(
                        onPressed: () {
                          launch(link);
                        },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
