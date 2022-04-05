import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/styles.dart';
import 'package:real_state/view/screens/auth/signin_screen.dart';

Widget skipBtn(BuildContext context) {
  return TextButton(
    onPressed: () =>
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SignInScreen())),
    child: Text("Skip",  style: LatoBold.copyWith(fontSize: 16, color: ColorResources.getTextColor(context)),),

  );
}