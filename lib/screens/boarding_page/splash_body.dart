// import 'package:flutter/material.dart';
// // import 'package:wave/model_class/config.dart';
// import 'package:wave/model_class/data.dart';
// import 'package:wave/screens/boarding_page/configrations/configration.dart';
// import 'package:wave/screens/boarding_page/configrations/constants.dart';
// import 'package:wave/screens/boarding_page/splash_contant.dart';
// // import 'package:wave/screens/boarding_page/splash_screen.dart';

// class Body extends StatefulWidget {
//   const Body({Key? key}) : super(key: key);

//   @override
//   State<Body> createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   int currentPage = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SizedBox(
//         width: double.infinity,
//         child: Column(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 25,
//                     bottom: 25,
//                     right: 25,
//                   ),
//                   child: Text(
//                     'skip',
//                     style: TextStyle(
//                       color: skipButtom,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               flex: 5,
//               child: PageView.builder(
//                 onPageChanged: (value) {
//                   setState(() {
//                     currentPage = value;
//                   });
//                 },
//                 itemCount: splashData.length,
//                 itemBuilder: (context, index) => SplashContent(
//                   head: splashData[index]["head"],
//                   image: splashData[index]["image"],
//                   text: splashData[index]["text"],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 5,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: getProportionateScreenWidth(20)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Container(
//                       height: 50,
//                       width: 50,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(25),
//                         border: Border.all(
//                           color:
//                               Color.fromRGBO(141, 141, 141, 1.0).withAlpha(50),
//                           width: 20,
//                         ),
//                       ),
//                       child: Icon(Icons.arrow_back),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: List.generate(
//                         splashData.length,
//                         (index) => buildDot(index: index),
//                       ),
//                     ),
//                     Container(
//                       height: 50,
//                       width: 50,
//                       decoration: BoxDecoration(
//                         color: rightButtom,
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       child: Icon(
//                         Icons.arrow_forward,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   AnimatedContainer buildDot({required int index}) {
//     return AnimatedContainer(
//       duration: kAnimationDuration,
//       margin: EdgeInsets.only(
//         right: 5,
//       ),
//       height: 10,
//       width: currentPage == index ? 10 : 10,
//       decoration: BoxDecoration(
//         color: currentPage == index ? rightButtom : Color(0xFFe5e5f0),
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
//   }
// }
