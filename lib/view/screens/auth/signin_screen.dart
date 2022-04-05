import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/helper/email_checker.dart';
import 'package:real_state/provider/auth_provider.dart';
import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/dimensions.dart';
import 'package:real_state/utill/images.dart';
import 'package:real_state/utill/styles.dart';
import 'package:real_state/view/base/custom_snackbar.dart';
import 'package:real_state/view/base/textfeild/custom_pass.dart';
import 'package:real_state/view/base/textfeild/custom_textfeild.dart';
import 'package:real_state/view/screens/package/package_screen.dart';

class SignInScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignInScreen> {
  FocusNode _accountNumberFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  TextEditingController _accountNumberController;
  TextEditingController _passwordController;
  GlobalKey<FormState> _formKeyLogin;


  @override
  void initState() {
    super.initState();
    _formKeyLogin = GlobalKey<FormState>();
    _accountNumberController = TextEditingController();
    _passwordController = TextEditingController();
    _accountNumberController.text = Provider.of<AuthProvider>(context, listen: false).getUserEmail() ?? '';
    _passwordController.text = Provider.of<AuthProvider>(context, listen: false).getUserPassword() ?? '';

  }

  @override
  void dispose() {
    _accountNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // NetworkInfo.checkConnectivity(context);

    return Scaffold(
      backgroundColor: ColorResources.getBackgroundColor(context),
      resizeToAvoidBottomInset: false,
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) => Form(
          key: _formKeyLogin,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.5),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [

                SizedBox(height: 140),
                // Align( alignment: Alignment.center, child: Image.asset(Images.asia, height: 60, width: 150, color: ColorResources.WHITE, fit: BoxFit.scaleDown,),),

                Align(alignment: Alignment.center,child: Text('AISA.net', style: LatoBold.copyWith(color: ColorResources.BLACK, fontSize: 40),)),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: CustomTextField(
                    hintTxt: 'Email',
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    focusNode: _accountNumberFocus,
                    nextNode: _passwordFocus,
                    isEmail: true,
                    controller: _accountNumberController,
                  ),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  child: CustomPassField(
                    hintTxt: 'Password',
                    textInputAction: TextInputAction.done,
                    focusNode: _passwordFocus,
                    controller: _passwordController,
                  ),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),


                !authProvider.isLoading ?  Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () async{
                      String _email = _accountNumberController.text.trim();
                      String _password = _passwordController.text.trim();
                      if (_email.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter Email Address'), backgroundColor: Colors.red,));
                      } else if (EmailChecker.isNotValid(_email)) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter Valid Email'), backgroundColor: Colors.red));
                      } else if (_password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter Password'), backgroundColor: Colors.red));
                      }else if (_password.length < 6) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Should Be 6'), backgroundColor: Colors.red));
                      }else {

                        if(_email == 'demo@gmail.com' && _password == '123456'){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => PackageList()), (route) => false);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successfully Done!'), backgroundColor: Colors.green));

                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Failed'), backgroundColor: Colors.red));
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorResources.WHITE, width: 1),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Text('LogIn', style: LatoMedium.copyWith(color: ColorResources.WHITE),),
                    ),
                  ),
                ) : Container(
                  alignment: Alignment.center,
                  height: 40,
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(ColorResources.COLOR_PRIMARY),
                  ),
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
