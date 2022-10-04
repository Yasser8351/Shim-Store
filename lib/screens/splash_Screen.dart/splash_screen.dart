import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '/model_class/config.dart';
// import '/screens/home_page/home_page.dart';
import '/screens/mainpage.dart';
// import 'package:wave/widget/loading_widget.dart';
// ignore: import_of_legacy_library_into_null_safe

class SplahScreen extends StatefulWidget {
  const SplahScreen({Key? key}) : super(key: key);

  @override
  State<SplahScreen> createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF25366C),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 235, 235, 236),
          // gradient: LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomRight,
          //   colors: [
          //     Color.fromARGB(255, 255, 231, 11),
          //     Color.fromARGB(255, 206, 70, 16),
          //   ],
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/cover.png',
              height: 500,
              width: 500,
            ),
            SizedBox(
              height: 50,
            ),
            if (Config.CopyRightStutas)
              GestureDetector(
                onTap: () {
                  launch('https://www.themsc.net');
                },
                child: Container(
                  alignment: Alignment.center,
                  // padding: EdgeInsets.only(left: 15),
                  // decoration: BoxDecoration(
                  //   color: Theme.of(context).colorScheme.secondary,
                  //   // borderRadius: BorderRadius.circular(125),
                  // ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/msclogo.png',
                        height: 80,
                        width: 80,
                      ),
                      Text(
                        'تم التطوير بواسطة شركة MSC',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
