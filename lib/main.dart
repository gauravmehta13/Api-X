import 'package:PublicApi/Splash%20Screen.dart';
import 'package:flutter/material.dart';

import 'HOmepage.dart';

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: new splash(),
      routes: <String, WidgetBuilder>{
        '/Homepage': (BuildContext context) => HomePage(),
      }));
}
