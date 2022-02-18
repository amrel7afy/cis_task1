import 'package:cis_task_1/home_layout/home_layout.dart';
import 'package:cis_task_1/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color(0xFF143E54),
              statusBarBrightness: Brightness.dark
            )
          ),
          textTheme: TextTheme(
              bodyText1: TextStyle(
                fontSize: 23,fontWeight: FontWeight.bold,
            color: Color(0xff48484A),
          )),
          scaffoldBackgroundColor: Color(0xFF143E54),
          iconTheme: IconThemeData(color: Colors.white)),

      home: HomeLayout(),
    );
  }
}
