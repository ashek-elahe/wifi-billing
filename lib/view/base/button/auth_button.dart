import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/dimensions.dart';
import 'package:real_state/utill/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String btnTxt;
  CustomButton({this.onTap, @required this.btnTxt});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
      child: Container(
        height: 35,
        margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ColorResources.getPrimaryColor(context),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 7, offset: Offset(0, 1)), // changes position of shadow
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Text(btnTxt,
            style: LatoSemiBold.copyWith(
              fontSize: 16,
              color: Colors.white,
            )),
      ),
    );
  }
}
