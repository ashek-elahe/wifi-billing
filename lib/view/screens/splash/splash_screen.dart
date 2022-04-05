import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/provider/auth_provider.dart';
import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/images.dart';
import 'package:real_state/utill/styles.dart';
import 'package:real_state/view/screens/auth/signin_screen.dart';
import 'package:real_state/view/screens/customer/customer_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _route();
  }

  void _route() {
    Timer(Duration(seconds: 2), () async {
      if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => CustomerScreen()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SignInScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorResources.getBackgroundColor(context),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Images.app_logo, height: 200, width: 200,),
              Text('Wifi Billing', style: LatoSemiBold.copyWith(color: ColorResources.getTextColor(context), fontSize: 40))
            ],
          ),
        ),
      ),
    );
  }
}
