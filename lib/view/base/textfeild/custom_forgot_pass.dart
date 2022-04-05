// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:real_state/provider/auth_provider.dart';
// import 'package:real_state/utility/dimentions.dart';
// import 'package:real_state/utility/images.dart';
// import 'package:real_state/view/basewidget/button/auth_button.dart';
// import 'package:real_state/view/basewidget/button/custom_appbar.dart';
// import 'package:real_state/view/basewidget/textfeild/custom_textfeild.dart';
// import 'package:real_state/view/screen/auth/widget/varification_screen.dart';
//
// class ForgotPasswordScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _emailController = TextEditingController();
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//        body: Column(
//         children: [
//           CustomAppBar(isBack: true,title: 'Forgot Password'),
//           Expanded(
//             child: Consumer<AuthProvider>(
//               builder: (context, auth, child) {
//                 return ListView(
//                   children: [
//                     Image.asset(
//                         Images.onBoarding_three,
//                         width: 142,
//                         height: 142),
//
//                     SizedBox(height: 40),
//                     Center(
//                         child: Text(
//                           'Please enter your number too',
//                           textAlign: TextAlign.center,
//                           style: SFBold.copyWith(color: Colors.grey,fontSize: 15),
//                         )),
//                     Padding(
//                       padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(height: 80),
//                           Text(
//                             'Email',
//                             style: SFBold.copyWith(color: Colors.grey,fontSize: 15),
//                           ),
//                           SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
//                           CustomTextField(
//                             hintText: 'example@gmail.com',
//                             isShowBorder: true,
//                             controller: _emailController,
//                             inputType: TextInputType.emailAddress,
//                             inputAction: TextInputAction.done,
//                           ),
//                           SizedBox(height: 24),
//                           CustomButton(
//                             btnTxt: 'Send',
//                             onTap: () {
//                               Navigator.of(context).push(MaterialPageRoute(builder: (_) => VerificationScreen(emailAddress: _emailController.text)));
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
