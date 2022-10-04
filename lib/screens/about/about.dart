import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '/model_class/config.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 250,
              width: 250,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              Config.appname_ar,
              softWrap: true,
              overflow: TextOverflow.clip,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Text(
                Config.Discrptions,
                style: const TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // GestureDetector(
                //   onTap: () {
                //     launch(Config.TikTokLink);
                //   },
                //   child: Container(
                //     alignment: Alignment.center,
                //     child: Image.asset(
                //       'assets/images/tiktok.jpg',
                //       height: 80,
                //       width: 80,
                //     ),
                //   ),
                // ),
                // GestureDetector(
                //   onTap: () {
                //     launch(Config.TwitterLink);
                //   },
                //   child: Container(
                //     alignment: Alignment.center,
                //     child: Image.asset(
                //       'assets/images/twitter.webp',
                //       height: 80,
                //       width: 80,
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    launch(Config.SnapchatLink);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/snapchat.jpg',
                      height: 80,
                      width: 80,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    launch(Config.InstgramLink);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/insta.webp',
                      height: 80,
                      width: 80,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            if (Config.CopyRightStutas)
              GestureDetector(
                onTap: () {
                  launch('https://www.themsc.net');
                },
                child: Container(
                  alignment: Alignment.center,
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
