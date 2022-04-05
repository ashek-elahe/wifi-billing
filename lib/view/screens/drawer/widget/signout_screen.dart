import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/provider/auth_provider.dart';
import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/dimensions.dart';
import 'package:real_state/utill/styles.dart';
import 'package:real_state/view/screens/auth/signin_screen.dart';

class SignOutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 300,
        child: Consumer<AuthProvider>(builder: (context, auth, child) {
          return Column(mainAxisSize: MainAxisSize.min, children: [

            SizedBox(height: 20),
            CircleAvatar(
              radius: 30,
              backgroundColor: ColorResources.COLOR_PRIMARY,
              child: Icon(Icons.contact_support, size: 50, color: ColorResources.WHITE,),
            ),

            Padding(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
              child: Text('Want to sign out?', style: LatoRegular, textAlign: TextAlign.center),
            ),

            Divider(height: 0, color: ColorResources.getHintColor(context)),

            !auth.isLoading ? Row(children: [

              Expanded(child: InkWell(
                onTap: () {
                  Provider.of<AuthProvider>(context, listen: false).clearSharedData().then((condition) {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => SignInScreen()),  (route) => false);
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))),
                  child: Text('Yes',  style: LatoSemiBold.copyWith(color: ColorResources.COLOR_PRIMARY,)),
                ),
              )),

              Expanded(child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorResources.COLOR_PRIMARY,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                  ),
                  child: Text('No', style: LatoSemiBold.copyWith(color: Colors.white)),
                ),
              )),

            ]) : Padding(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ColorResources.getPrimaryColor(context))),
            ),
          ]);
        }),
      ),
    );
  }
}
