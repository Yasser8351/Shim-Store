import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '/model_class/config.dart';
import '/screens/about/about.dart';
import '/screens/contact_us/contact_us.dart';

import 'home_page/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _selectedPageIndex;
  late List<Widget> _pages;
  late PageController _pageController;

  void initState() {
    super.initState();

    _selectedPageIndex = 1;
    _pages = [
      AboutPage(),
      HomePage(),
      // ContactUs(),
      ContactUs(),
    ];
    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int index = 1;

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Config.iconCenter, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.email, size: 30),
    ];
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Config.IconsColor)),
        child: CurvedNavigationBar(
            color: Color(0xFF25366C),
            buttonBackgroundColor: Config.IconsBackgroundColor,
            backgroundColor: Colors.transparent,
            items: items,
            index: index,
            height: 50,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 300),
            onTap: (selectedPageIndex) {
              setState(() {
                _selectedPageIndex = selectedPageIndex;
                _pageController.jumpToPage(selectedPageIndex);
              });
            } //(index) => setState(() => this.index = index),
            ),
      ),
    );
  }
}
