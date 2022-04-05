import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/provider/profile_provider.dart';
import 'package:real_state/provider/theme_provider.dart';
import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/styles.dart';

class ProfileButton extends StatelessWidget {
  final String title;
  final int index;
  final Widget widget;
  ProfileButton({@required this.index, @required this.title, @required this.widget});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, profile, child) {
      return InkWell(
        onTap: () {
          profile.changeButton(index);
          Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
        },
        child:  Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: ColorResources.getGrayColor(context), width: 1),
              borderRadius: BorderRadius.circular(12),
              color: profile.profileIndex == index ? ColorResources.getPrimaryColor(context) : ColorResources.getBackground2Color(context)
          ),
          child: Text(title, style: LatoRegular.copyWith(color: profile.profileIndex == index ? ColorResources.WHITE : ColorResources.getTextColor(context) ),),
        ),
      );
    },
    );
  }
}
