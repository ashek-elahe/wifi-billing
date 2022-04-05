// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:real_state/utill/color_resources.dart';
// import 'package:real_state/utill/images.dart';
// import 'package:real_state/utill/styles.dart';
//
// class OnBoardingTwo extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: double.infinity,
//         width: double.infinity,
//         color: ColorResources.getBackgroundColor(context),
//         child:
//         Stack(
//           children: [
//
//             Positioned(child: Image.asset(Images.logo_gold, width: 90, height: 90,),
//               top: 50,
//               left: 50,
//               right: 50,),
//
//             Column(
//               children: [
//                 Image.asset(Images.on_board2_top, width: double.infinity,),
//                 SizedBox(height: 10,),
//                 Image.asset(Images.on_board2_center, width: double.infinity,),
//                 // SizedBox(height: 10,),
//
//                 Expanded(child: Center(
//                   child: Column(
//                     children: [
//                       Text("Welcome",  style: LatoBold.copyWith(fontSize: 28, color: ColorResources.getTextColor(context)),),
//                       Padding(
//                           padding: EdgeInsets.only(left: 30 , right: 30, top: 10),
//                           child: Text("in google chrome devtools you can quickly get the decimal numbers for a hex-style color; just click on the tiny color rectangle in the styles sidebar; "
//                               "in the popup you can switch the representation between HSLA,")
//                       ),
//                     ],
//                   )
//                   )),
//               ],
//             ),
//
//             /*Positioned(child: Container(
//               width: double.infinity,
//               child: Image.asset(Images.bottom_shape, width: double.infinity,),
//             ),
//             bottom: -15,
//             left: -10,
//             right: -10,)*/
//
//           ],
//         )
//     );
//   }
// }
