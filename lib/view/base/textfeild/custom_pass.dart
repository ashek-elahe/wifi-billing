
import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/dimensions.dart';
import 'package:real_state/utill/images.dart';
import 'package:real_state/utill/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPassField extends StatefulWidget {
  final TextEditingController controller;
  final String hintTxt;
  final FocusNode focusNode;
  final FocusNode nextNode;
  final TextInputAction textInputAction;


  CustomPassField({
    this.controller,
    this.hintTxt,
    this.focusNode,
    this.nextNode,
    this.textInputAction
  });

  @override
  _CustomPassFieldState createState() => _CustomPassFieldState();
}

class _CustomPassFieldState extends State<CustomPassField> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: Dimensions.FONT_SIZE_EXTRA_LARGE),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorResources.GREY, width: 1),
      ),
      child: TextFormField(
        cursorColor: ColorResources.COLOR_PRIMARY,
        controller: widget.controller,
        obscureText: _obscureText,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        onFieldSubmitted: (v) {
          setState(() {
            widget.textInputAction == TextInputAction.done
                ? FocusScope.of(context).consumeKeyboardToken()
                : FocusScope.of(context).requestFocus(widget.nextNode);
          });
        },
        validator: (value) {
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,color: ColorResources.HINT_TEXT_COLOR),
            onPressed: _toggle,
          ),
          hintText: widget.hintTxt ?? '',
          contentPadding: EdgeInsets.only(top: 15, left: 20),
          isDense: true,
          hintStyle: LatoBold.copyWith(color: ColorResources.HINT_TEXT_COLOR,fontSize: Dimensions.FONT_SIZE_SMALL),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
