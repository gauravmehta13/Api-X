import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CategoryDetails extends StatefulWidget {
  var category;
  // ignore: non_constant_identifier_names
  CategoryDetails({
    this.category,
  });
  @override
  _CategoryDetailsState createState() => _CategoryDetailsState(category);
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List data;
  var category;
  _CategoryDetailsState(category);
  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Future<String> getData() async {
    setState(() {
      category = category;
    });
    var response = await http.get(
        "https://api.publicapis.org/entries?category=$category&https=true",
        headers: {
          "Accept": "application/json"
        }); //("https://api.publicapis.org/entries?category=animals&https=true");

    // var data = response.body;
    print(response.body);
    setState(() {
      var convertdata = json.decode(response.body);
      data = convertdata['entries'];
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      category = category;
    });
    return new Scaffold(
        body: GridView.builder(
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
                        category: data[index]["API"],
                      )));
            },
            padding: EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Text(data[index]['API'].toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    textStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  )),
            ),
          ),
        ),
      ),
    ));
  }
}
