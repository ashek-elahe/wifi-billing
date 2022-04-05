// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:real_state/utill/color_resources.dart';
// import 'package:real_state/utill/images.dart';
// import 'package:real_state/utill/styles.dart';
//
// class OnBoardingOne extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       color: ColorResources.getBackgroundColor(context),
//       child: Column(
//         children: [
//           Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Image.asset(Images.on_Boar1_top, width: double.infinity, color: ColorResources.getPrimaryColor(context),),
//               Positioned(child: Container(
//                 width: double.infinity,
//                 child: Image.asset(Images.app_logo, width: 70, height: 70,),
//               ),
//                 top: 70,
//                 left: 50,
//                 right: 50,),
//
//             ],),
//           SizedBox(height: 20,),
//           Center(
//             child: Text("Welcome",  style: LatoBold.copyWith(fontSize: 28, color: ColorResources.getTextColor(context)),),
//           ),
//           // SizedBox(height: 10,),
//           Expanded(child: Center(
//             child: Image.asset(Images.on_boar1_center, width: double.infinity-40,),
//           ))
//         ],
//       )
//     );
//   }
// }
