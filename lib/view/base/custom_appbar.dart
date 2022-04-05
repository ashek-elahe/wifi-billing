import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:real_state/provider/profile_provider.dart';
import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/dimensions.dart';
import 'package:real_state/utill/images.dart';
import 'package:flutter/material.dart';
import 'package:real_state/utill/styles.dart';
import 'package:real_state/view/screens/profile/profile_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function onPressed;
  CustomAppBar({@required this.title, this.onPressed});

  @override
  Size get preferredSize => Size(double.maxFinite, 80);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
          image: DecorationImage(
            image: AssetImage(Images.on_board2_top),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: onPressed,
                child: Image.asset(Images.drawer, height: 30, width: 30, color:  ColorResources.getPrimaryBGColor(context),),
              ),
              Text(title ?? '', style: LatoBold.copyWith(color: ColorResources.getTextColor(context), fontSize: Dimensions.FONT_SIZE_LARGE)),
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen())),
                child: Consumer<ProfileProvider>(
                    builder: (context, profile, child) {
                      return Image.asset( profile.userInfoModel != null ? profile.userInfoModel.image : Images.profile, height: 40, width: 40, color: ColorResources.getPrimaryBGColor(context));
                    }
                    )
              ),
            ],
          ),
        ),
      ), preferredSize: Size.fromHeight(120)),
    );
  }


}

