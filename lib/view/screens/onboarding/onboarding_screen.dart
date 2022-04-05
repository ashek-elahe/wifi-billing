// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';
// import 'package:real_state/provider/onboarding_provider.dart';
// import 'package:real_state/utill/color_resources.dart';
// import 'package:real_state/view/base/button/CommnButton.dart';
// import 'package:real_state/view/screens/onboarding/onBoarding_1.dart';
// import 'onBoarding_2.dart';
// import 'onBoarding_3.dart';
//
// class OnBoardingScreen extends StatelessWidget {
//   final Color indicatorColor;
//   final Color selectedIndicatorColor;
//
//   OnBoardingScreen({
//     this.indicatorColor = Colors.grey,
//     this.selectedIndicatorColor = Colors.black,
//   });
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Consumer<OnBoardingProvider>(
//       builder: (context, onBoardingList, child) => Scaffold(
//         body: SafeArea(
//           child: Stack(clipBehavior: Clip.none, children: [
//             Positioned(child: Container(
//               width: double.infinity,
//               height: double.infinity,
//               color: ColorResources.getBackgroundColor(context),
//               child: PageView(
//                 onPageChanged: (index) { onBoardingList.changeSelectIndex(index);
//                 },
//                 children: [
//                   OnBoardingOne(),
//                   OnBoardingTwo(),
//                   OnBoardingThree()
//                 ],
//               ),
//             )),
//             Positioned( left: 50,
//                 right: 50,
//                 bottom: 30,
//                 child: Padding( padding: EdgeInsets.zero,
//                   child: Row( mainAxisAlignment: MainAxisAlignment.center,
//                     children: _pageIndicators(onBoardingList.onBoardingList, context),
//                   ),
//                 )),
//             Positioned(
//                 right: 50,
//                 bottom: 10,
//                 child: skipBtn(context))
//           ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   List<Widget> _pageIndicators(var onBoardingList, BuildContext context) {
//     List<Container> _indicators = [];
//     for (int i = 0; i < 3; i++) {
//       _indicators.add(
//         Container(
//           width: i == Provider.of<OnBoardingProvider>(context).selectedIndex ? 20 : 10,
//           height: 7,
//           margin: EdgeInsets.only(right: 3,left: 3),
//           decoration: BoxDecoration(
//             color: i == Provider.of<OnBoardingProvider>(context).selectedIndex ? ColorResources.getPrimaryColor(context) : Colors.grey[500],
//             borderRadius: i == Provider.of<OnBoardingProvider>(context).selectedIndex ? BorderRadius.circular(50) : BorderRadius.circular(35),
//           ),
//         ),
//       );
//     }
//     return _indicators;
//   }
//
// }
