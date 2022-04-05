import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/provider/profile_provider.dart';
import 'package:real_state/provider/theme_provider.dart';
import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/dimensions.dart';
import 'package:real_state/utill/images.dart';
import 'package:real_state/utill/styles.dart';
import 'package:real_state/view/screens/customer/customer_screen.dart';
import 'package:real_state/view/screens/drawer/widget/signout_screen.dart';
import 'package:real_state/view/screens/package/add_package.dart';
import 'package:real_state/view/screens/package/package_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);
    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).darkTheme ? Color(0xff4A4B4B) : Color(0xffF3F9FF),
      body: Consumer<ProfileProvider>(
        builder: (context, profile, child){
          return ListView(
            physics: ClampingScrollPhysics(),
            children: [
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorResources.COLOR_PRIMARY,
                      ),
                      child: Center(
                        child: Image.asset(
                          profile.userInfoModel.image,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${profile.userInfoModel != null ? profile.userInfoModel.name : ''}',
                            style: LatoSemiBold.copyWith(
                                color: ColorResources.getTextColor(context), fontSize: 14)),
                        SizedBox(
                          height: 5,
                        ),
                        Text('${profile.userInfoModel != null ? profile.userInfoModel.email : ''}',
                            style: LatoRegular.copyWith(
                                color: ColorResources.getTextColor(context), fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<ThemeProvider>(
                builder: (context, theme, child) => SwitchListTile(
                  value: theme.darkTheme,
                  onChanged: (bool isActive) => theme.toggleTheme(),
                  title: Text('Dark', style: LatoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
                  activeColor: ColorResources.getPrimaryColor(context),
                ),
              ),

              CustomDrawerWidget(
                  title: 'Customer List',
                  image: Images.attendance,
                  widget: CustomerScreen()),
              menuDivider(context),
              CustomDrawerWidget(
                  title: 'Package List',
                  image: Images.applyLeave,
                  widget: PackageList()),
              menuDivider(context),
              CustomDrawerWidget(
                  title: 'Add Package',
                  image: Images.applyLeave,
                  widget: AddPackageScreen()),
              menuDivider(context),
              CustomDrawerWidget(
                title: 'LogOut',
                image: Images.log_out,
                widget: SignOutDialog(),
                isLogout: true,
              ),
              menuDivider(context),
              SizedBox(
                height: 20,
              ),
            ],
          );
        }
      ),
    );
  }
}

class CustomDrawerWidget extends StatelessWidget {
  final String title;
  final String image;
  final Widget widget;
  final bool isLogout;

  CustomDrawerWidget(
      {@required this.title,
        @required this.image,
        @required this.widget,
        this.isLogout = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => isLogout
            ? showCupertinoDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => widget)
            : Navigator.push(
            context, MaterialPageRoute(builder: (_) => widget)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        title: Text(title,
            style: LatoBold.copyWith(
                color: ColorResources.getTextColor(context), fontSize: 14)),
        leading: Image.asset(
          image,
          height: 25,
          width: 25,
          color: Provider.of<ThemeProvider>(context).darkTheme ? ColorResources.WHITE : ColorResources.getPrimaryColor(context),
        )
    );
  }


}

Widget menuDivider(BuildContext context) {
  return Container(
    height: 4,
    width: double.infinity,
    decoration: BoxDecoration(
      color: ColorResources.getTextColor(context),
      gradient: Provider.of<ThemeProvider>(context).darkTheme ?
      LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff6D6D6D),
            Color(0xff353535),
          ]) : LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffF1F1F1),
            Color(0xff9E9E9E),
          ]),
    ),
  );
}
