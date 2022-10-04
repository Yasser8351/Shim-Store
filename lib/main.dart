import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shim_store/model_class/config.dart';
import './screens/splash_Screen.dart/splash_screen.dart';

Future main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.appname,
      home: Directionality(
        textDirection: TextDirection.rtl, //
        child: SplahScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
