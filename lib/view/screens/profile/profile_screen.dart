import 'package:provider/provider.dart';
import 'package:real_state/provider/profile_provider.dart';
import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/dimensions.dart';
import 'package:real_state/utill/images.dart';
import 'package:real_state/utill/styles.dart';
import 'package:real_state/view/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:real_state/view/screens/drawer/drawer_screen.dart';
import 'package:real_state/view/screens/profile/profile_edit_screen.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _globalKey = GlobalKey();
    Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);

    return Scaffold(
      key: _globalKey,
      backgroundColor: ColorResources.getBackgroundColor(context),
      appBar: CustomAppBar(title: 'MY PROFILE', onPressed: () => _globalKey.currentState.openDrawer(),),
      drawer: Drawer(child: CustomDrawer()),
      body: Consumer<ProfileProvider>(
          builder: (context, profileProvider, child) => ListView(
          children: [

            // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
            Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 80,
                      width: 80,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                      decoration: BoxDecoration(
                          color: ColorResources.getPrimaryColor(context),
                          shape: BoxShape.circle
                      ),
                      child:
                      Image.asset(
                        profileProvider.userInfoModel != null ? profileProvider.userInfoModel.image : Images.profile,
                        height: 60, width: 60, fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),

                  Positioned(
                    right: 40,
                    bottom: 0,
                    child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileEditScreen()));
                        },
                        child: Image.asset(Images.edit, height: 50,width: 50 , color: ColorResources.getTextColor(context),)),
                  )
                ]
            ),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Name && Phone
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  Row(children: [
                    Expanded(child: Column( crossAxisAlignment: CrossAxisAlignment.start ,children: [
                      Text('Name', style: LatoSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.getTextColor(context))),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT, vertical: Dimensions.PADDING_SIZE_SMALL),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: ColorResources.GREY, width: 1),
                            color: ColorResources.getBackgroundColor(context)
                        ),
                        child: Text(
                          '${profileProvider.userInfoModel.name ?? ''}',
                          style: LatoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT),
                        ),
                      ),
                    ],)),
                    SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL,),
                    Expanded(child: Column( crossAxisAlignment: CrossAxisAlignment.start ,children: [
                      Text('Phone Number', style: LatoSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.getTextColor(context))),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT, vertical: Dimensions.PADDING_SIZE_SMALL),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: ColorResources.GREY, width: 1),
                            color: ColorResources.getBackgroundColor(context)
                        ),
                        child: Text(
                          '${profileProvider.userInfoModel.phone ?? ''}',
                          style: LatoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT),
                        ),
                      ),
                    ],))
                  ],),

                  // Mail
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  Text('Mail', style: LatoSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.getTextColor(context))),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT, vertical: Dimensions.PADDING_SIZE_SMALL),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: ColorResources.GREY, width: 1),
                        color: ColorResources.getBackgroundColor(context)
                    ),
                    child: Text(
                      '${profileProvider.userInfoModel.email ?? ''}',
                      style: LatoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT),
                    ),
                  ),



                  //Address
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  Text('Address', style: LatoSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.getTextColor(context))),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT, vertical: Dimensions.PADDING_SIZE_SMALL),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: ColorResources.GREY, width: 1),
                        color: ColorResources.getBackgroundColor(context)
                    ),
                    child: Text(
                      '${profileProvider.userInfoModel.address ?? ''}',
                      style: LatoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

