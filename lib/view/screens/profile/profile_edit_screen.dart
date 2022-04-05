import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:real_state/data/model/response/response_model.dart';
import 'package:real_state/data/model/response/user_model.dart';
import 'package:real_state/provider/profile_provider.dart';
import 'package:real_state/provider/theme_provider.dart';
import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/dimensions.dart';
import 'package:real_state/utill/styles.dart';
import 'package:real_state/view/base/custom_appbar.dart';
import 'package:real_state/view/base/custom_snackbar.dart';
import 'package:real_state/view/base/textfeild/custom_textfeild.dart';
import 'package:real_state/view/screens/drawer/drawer_screen.dart';

class ProfileEditScreen extends StatefulWidget {
  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {

  FocusNode _nameFocus = FocusNode();
  FocusNode _phoneFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _addressFocus = FocusNode();
  TextEditingController _nameController;
  TextEditingController _phoneController;
  TextEditingController _emailController;
  TextEditingController _addressController;
  GlobalKey<ScaffoldState> _globalKey;

  File file;
  final picker = ImagePicker();

  void _choose() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery, imageQuality: 50, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


  @override
  void initState() {
    super.initState();
    _globalKey = GlobalKey<ScaffoldState>();
    _nameFocus = FocusNode();
    _emailFocus = FocusNode();
    _phoneFocus = FocusNode();
    _addressFocus = FocusNode();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();

    if (Provider.of<ProfileProvider>(context, listen: false).userInfoModel != null) {
      UserInfoModel _userInfoModel = Provider.of<ProfileProvider>(context, listen: false).userInfoModel;
      _nameController.text = _userInfoModel.name ?? '';
      _phoneController.text = _userInfoModel.phone ?? '';
      _emailController.text = _userInfoModel.email ?? '';
      _addressController.text = _userInfoModel.address ?? '';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: ColorResources.getBackgroundColor(context),
      appBar: CustomAppBar(title: 'MY PROFILE', onPressed: () => _globalKey.currentState.openDrawer(),),
      drawer: Drawer(child: CustomDrawer()),
      body: Consumer<ProfileProvider>(
        builder: (context, profile, child) => ListView(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
            physics: BouncingScrollPhysics(),
            children: [

              Align(
                child: Stack(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      padding: file == null ? EdgeInsets.all(12) : EdgeInsets.all(5) ,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                      ),
                      child: file == null
                          ? Image.asset(profile.userInfoModel.image, height: 80, width: 80, fit: BoxFit.cover,)
                          : ClipRRect(borderRadius: BorderRadius.circular(50) ,child: Image.file(file, height: 80, width: 80, fit: BoxFit.cover,)),
                    )  ,
                    Positioned(
                        top: 4,
                        right: 0,
                        child: InkWell(
                          onTap: _choose,
                          child: Container(
                              height: 25,
                              width: 25,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorResources.getPrimaryColor(context)
                              ),
                              child: Icon(CupertinoIcons.switch_camera, color: ColorResources.WHITE, size: 15,)),
                        ))
                  ],
                ),
              ),

              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),

              Row(children: [
                Expanded(child: Column( crossAxisAlignment: CrossAxisAlignment.start ,children: [
                  CustomTextField(
                    hintTxt: 'Type Name',
                    focusNode: _nameFocus,
                    nextNode: _emailFocus,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: _nameController,
                  ),
                ],)),

                SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL,),
                Expanded(child: Column( crossAxisAlignment: CrossAxisAlignment.start ,children: [
                  CustomTextField(
                    hintTxt: 'Type Phone',
                    focusNode: _phoneFocus,
                    nextNode: _addressFocus,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    controller: _phoneController,
                  ),
                ],))
              ],),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              CustomTextField(
                hintTxt: 'Type Mail',
                focusNode: _emailFocus,
                nextNode: _phoneFocus,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: _emailController,
              ),

              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              CustomTextField(
                hintTxt: 'Type Address',
                focusNode: _addressFocus,
                textInputType: TextInputType.streetAddress,
                textInputAction: TextInputAction.done,
                controller: _addressController,
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),

              !profile.isLoading ?  Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () async{
                    String _name = _nameController.text.trim();
                    String _email = _emailController.text.trim();
                    String _phone = _phoneController.text.trim();
                    String _address = _addressController.text.trim();
                    if (profile.userInfoModel.name == _name &&
                        profile.userInfoModel.email == _email &&
                        profile.userInfoModel.phone == _phone &&
                        profile.userInfoModel.address == _address &&
                        file == null) {
                      showCustomSnackBar(message: 'Change something to store', context: context);
                    }else if (_name.isEmpty) {
                      showCustomSnackBar(message: 'Enter Name', context: context);
                    }else if (_email.isEmpty) {
                      showCustomSnackBar(message: 'Enter Mail Address', context: context);
                    }else if (_phone.isEmpty) {
                      showCustomSnackBar(message: 'Enter Phone Number', context: context);
                    }else if (_address.isEmpty) {
                      showCustomSnackBar(message: 'Enter Address', context: context);
                    } else {
                      UserInfoModel updateUserInfoModel = profile.userInfoModel;
                      updateUserInfoModel.name = _name ?? "";
                      updateUserInfoModel.email = _email ?? "";
                      updateUserInfoModel.phone = _phone ?? "";
                      updateUserInfoModel.address = _address ?? '';
                       ResponseModel _responseModel = await profile.updateUserInfo(updateUserInfoModel, '', file, '');
                      if(_responseModel.isSuccess) {
                        //showCustomSnackBar(message: 'Store Successfully', context: context, isError: false);
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Store Successfully'), backgroundColor: Colors.green));
                        Navigator.pop(context);
                      }else {
                        showCustomSnackBar(message: _responseModel.message, context: context);
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_responseModel.message), backgroundColor: Colors.red));
                      }
                      setState(() {});
                    }

                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorResources.getPrimaryBGColor(context), width: 1),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text('Update', style: LatoMedium.copyWith(color: Provider.of<ThemeProvider>(context).darkTheme ? ColorResources.WHITE : ColorResources.COLOR_PRIMARY),),
                  ),
                ),
              ) : Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(ColorResources.COLOR_PRIMARY))),

            ]),
      ),
    );
  }
}
