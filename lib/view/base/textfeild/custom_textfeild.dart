import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/dimensions.dart';
import 'package:real_state/utill/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintTxt;
  final TextInputType textInputType;
  final int maxLine;
  final FocusNode focusNode;
  final FocusNode nextNode;
  final TextInputAction textInputAction;
  final bool isPhoneNumber;
  final bool isEmail;
  final Function onSaved;
  final bool isAuth;
  final Color fillColor;

  CustomTextField(
      {this.controller,
        this.hintTxt,
        this.textInputType,
        this.maxLine,
        this.focusNode,
        this.nextNode,
        this.textInputAction,
        this.isEmail = false,
        this.isPhoneNumber = false,
        this.onSaved,
        this.isAuth = true,
        this.fillColor});


  @override
  Widget build(context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorResources.GREY, width: 1),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLine ?? 1,
        cursorColor: ColorResources.COLOR_PRIMARY,
        focusNode: focusNode,
        keyboardType: textInputType ?? TextInputType.text,
        initialValue: null,
        onSaved: onSaved,
        textInputAction: textInputAction ?? TextInputAction.next,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(nextNode);
        },
        inputFormatters: [
          isPhoneNumber?FilteringTextInputFormatter.digitsOnly:
          FilteringTextInputFormatter.singleLineFormatter],
        validator: (input) => isEmail?input.isValidEmail() ? null : 'Please Provide a Valid Email' : null,
        decoration: InputDecoration(
          hintText: hintTxt ?? '',
          contentPadding: EdgeInsets.symmetric(horizontal: 5),
          isDense: true,
          hintStyle: LatoBold.copyWith(color: ColorResources.HINT_TEXT_COLOR,fontSize: Dimensions.FONT_SIZE_SMALL),
          errorStyle: TextStyle(height: 1.5),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
