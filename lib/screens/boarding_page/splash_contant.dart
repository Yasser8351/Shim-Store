// import 'package:flutter/material.dart';
// import 'package:wave/screens/boarding_page/configrations/configration.dart';
// import 'package:wave/screens/boarding_page/configrations/constants.dart';

// class SplashContent extends StatelessWidget {
//   final String head, image, text;
//   const SplashContent({
//     Key? key,
//     required this.head,
//     required this.image,
//     required this.text,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Image.asset(
//           image,
//           height: getProportionateScreenHeight(365),
//           width: getProportionateScreenWidth(390),
//         ),
//         Spacer(
//           flex: 2,
//         ),
//         Text(
//           head,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: headColor,
//             fontWeight: FontWeight.bold,
//             fontSize: 25,
//           ),
//         ),
//         const SizedBox(
//           height: 10.0,
//         ),
//         Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: bodyColor,
//             fontSize: 18,
//           ),
//         )
//       ],
//     );
//   }
// }
