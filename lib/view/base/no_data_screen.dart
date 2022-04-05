import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/dimensions.dart';
import 'package:real_state/utill/images.dart';
import 'package:real_state/utill/styles.dart';
import 'package:flutter/material.dart';
class NoDataScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      child: Align(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [

          Image.asset(
           Images.no_data,
            width: MediaQuery.of(context).size.height*1, height: MediaQuery.of(context).size.height*.5,
          ),

          Text(
            'Nothing Found',
            style: LatoBold.copyWith(color: ColorResources.getPrimaryColor(context), fontSize: MediaQuery.of(context).size.height*0.023),
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
