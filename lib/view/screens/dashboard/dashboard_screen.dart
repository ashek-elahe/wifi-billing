// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:real_state/utill/color_resources.dart';
// import 'package:real_state/utill/dimensions.dart';
// import 'package:real_state/utill/images.dart';
// import 'package:real_state/view/screens/home/home.dart';
// import 'package:real_state/view/screens/package/add_package.dart';
// import 'package:real_state/view/screens/map/current_location.dart';
// import 'package:real_state/view/screens/notification/notification_screen.dart';
//
// class DashboardScreen extends StatefulWidget {
//
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   PageController _pageController;
//   int _pageIndex = 0;
//   List<Widget> _screens;
//   GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: 0);
//
//     _screens = [
//       HomeScreen(),
//       AddLeaveScreen(),
//       NotificationScreen(),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (_pageIndex != 0) {
//           _setPage(0);
//           return false;
//         } else {
//           return true;
//         }
//       },
//       child: Scaffold(
//         key: _scaffoldKey,
//         backgroundColor: _pageIndex == 0 ? ColorResources.getBackgroundColor(context) : _pageIndex == 1 ? ColorResources.BLACK : ColorResources.getBackgroundColor(context),
//         floatingActionButton:  FloatingActionButton(
//           elevation: 5,
//           backgroundColor:  ColorResources.WHITE,
//           onPressed: () => _setPage(1),
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Icon(CupertinoIcons.add, color: ColorResources.COLOR_PRIMARY, size: 30,),
//              // Image.asset(Images.car, fit: BoxFit.scaleDown, height: 40, width: 40,),
//               /* Positioned(
//                   top: -2,
//                   right: -2,
//                   child: Container(
//                     height: 20,
//                     width: 20,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: ColorResources.getPrimaryColor(context)
//                     ),
//                     child: Icon(Icons.my_location, color: ColorResources.WHITE, size: 12,),
//               ))*/
//             ],
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//
//         bottomNavigationBar: ClipRRect(
//           borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.PADDING_SIZE_DEFAULT), topLeft:Radius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
//           child: BottomAppBar(
//             elevation: 0,
//             notchMargin: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                     colors: [
//                       Color(0xff3647B2),
//                       Color(0xff0F5EF7),
//                       Color(0xff3647B2),
//                       Color(0xff0F5EF7),
//                       Color(0xff3647B2),
//                     ]
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
//                 child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween ,children: [
//                   BottomNavItem(image: Images.nav_home, isSelected: _pageIndex == 0, onTap: () => _setPage(0)),
//                   Expanded(child: SizedBox()),
//                   BottomNavItem(image: Images.notification, isSelected: _pageIndex == 2, onTap: () => _setPage(2)),
//                 ]),
//               ),
//             ),
//           ),
//         ),
//         body: PageView.builder(
//           controller: _pageController,
//           itemCount: _screens.length,
//           physics: NeverScrollableScrollPhysics(),
//           itemBuilder: (context, index) {
//             return _screens[index];
//           },
//         ),
//       ),
//     );
//   }
//
//   void _setPage(int pageIndex) {
//     setState(() {
//       _pageController.jumpToPage(pageIndex);
//       _pageIndex = pageIndex;
//     });
//   }
// }
//
//
//
// class BottomNavItem extends StatelessWidget {
//   final String image;
//   final Function onTap;
//   final bool isSelected;
//   BottomNavItem({@required this.image, this.onTap, this.isSelected = false});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: InkWell(
//           onTap: onTap,
//           child: Image.asset(
//             image,
//             height: isSelected ? 40: 35,
//             width: isSelected ? 40: 35,
//           )
//       ),
//     );
//   }
// }
