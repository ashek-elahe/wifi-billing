
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/data/model/body/leaveType.dart';
import 'package:real_state/data/model/response/customer_model.dart';
import 'package:real_state/helper/user_helper.dart';
import 'package:real_state/provider/customer_provider.dart';
import 'package:real_state/provider/package_provider.dart';
import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/dimensions.dart';
import 'package:real_state/utill/styles.dart';
import 'package:real_state/view/base/custom_appbar.dart';
import 'package:real_state/view/base/custom_snackbar.dart';
import 'package:real_state/view/base/textfeild/custom_textfeild.dart';
import 'package:real_state/view/screens/drawer/drawer_screen.dart';


class AddCustomerScreen extends StatefulWidget {
  final bool isUpdate;
  final int index;
  final CustomerModel packageModel;
  AddCustomerScreen({this.isUpdate = false, this.index, this.packageModel});
  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {

  FocusNode _nameFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _phoneFocus = FocusNode();
  FocusNode _addressFocus = FocusNode();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  GlobalKey<FormState> _formKeyLogin;
  GlobalKey<ScaffoldState> _globalKey;


  @override
  void initState() {
    super.initState();
    _globalKey = GlobalKey<ScaffoldState>();
    _formKeyLogin = GlobalKey<FormState>();
    Provider.of<PackageProvider>(context, listen: false).initPackageTypeList(context);
    Provider.of<PackageProvider>(context, listen: false).initPackageNameList(context);

    if(widget.isUpdate && widget.packageModel != null){
      //_priceController.text = '${widget.packageModel.price}';
      if (widget.packageModel.type == 'Economic') {
        Provider.of<PackageProvider>(context, listen: false).setPackageTypeIndex(0, false);
      } else if(widget.packageModel.type == 'Basic') {
        Provider.of<PackageProvider>(context, listen: false).setPackageTypeIndex(1, false);
      }else if(widget.packageModel.type == 'Family') {
        Provider.of<PackageProvider>(context, listen: false).setPackageTypeIndex(2, false);
      }else if(widget.packageModel.type == 'Bachelor') {
        Provider.of<PackageProvider>(context, listen: false).setPackageTypeIndex(3, false);
      }else if(widget.packageModel.type == 'Fast') {
        Provider.of<PackageProvider>(context, listen: false).setPackageTypeIndex(4, false);
      }else {
        Provider.of<PackageProvider>(context, listen: false).setPackageTypeIndex(5, false);
      }
    }else{
      Provider.of<PackageProvider>(context, listen: false).setPackageTypeIndex(-1, false);
      Provider.of<PackageProvider>(context, listen: false).setPackageNameIndex(-1, false);
      _nameController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _globalKey,
      backgroundColor: ColorResources.getBackgroundColor(context),
      appBar: CustomAppBar(title: 'ADD CUSTOMER', onPressed: () => _globalKey.currentState.openDrawer(),),
      drawer: Drawer(child: CustomDrawer()),
      body: Form(
        key: _formKeyLogin,
        child: SafeArea(
            child: Consumer<CustomerProvider>(
                builder: (context, package, child) => ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT, vertical: Dimensions.FONT_SIZE_SMALL),
                  children: [


                    // For Remark
                    Text('Name', style: LatoSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.getTextColor(context))),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    CustomTextField(
                      hintTxt: 'Name',
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      focusNode: _nameFocus,
                      nextNode: _emailFocus,
                      isEmail: false,
                      controller: _nameController,
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),


                    // For Package Type
                    Text('Package Type', style: LatoSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.getTextColor(context))),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    Consumer<PackageProvider>(
                      builder: (context, package, child) => package.packageTypeList != null ? package.packageTypeList.length > 0 ? Container(
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: ColorResources.GREY, width: 1),
                        ),
                        child: DropdownButton<PackageTypeModel>(
                          underline: SizedBox(),
                          isExpanded: true,
                          hint: Text('Select Package Type', style: LatoRegular),
                          icon: Icon(CupertinoIcons.chevron_forward, size: 20, color: ColorResources.getHintColor(context)),
                          value: package.packageIndex == -1 ? null : package.packageTypeList[package.packageIndex],
                          items: package.packageTypeList.map((PackageTypeModel clientData) {
                            return DropdownMenuItem<PackageTypeModel>(
                              value: clientData,
                              child: Text(clientData.leaveType, style: LatoRegular, overflow: TextOverflow.ellipsis),
                            );
                          }).toList(),
                          onChanged: (PackageTypeModel clientData) {
                            int index = package.packageTypeList.indexOf(clientData);
                            package.setPackageTypeIndex(index, true);
                          },
                        ),
                      ) : Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT),
                          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorResources.getPrimaryColor(context)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text('No Client Yet!')) : Center(child: CupertinoActivityIndicator()) ,
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),



                    // For Remark
                    Text('Email', style: LatoSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.getTextColor(context))),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    CustomTextField(
                      hintTxt: 'Email',
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      focusNode: _emailFocus,
                      nextNode: _phoneFocus,
                      isEmail: true,
                      controller: _emailController,
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),

                    // For Remark
                    Text('Phone', style: LatoSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.getTextColor(context))),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    CustomTextField(
                      hintTxt: 'Phone',
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      focusNode: _phoneFocus,
                      nextNode: _addressFocus,
                      isEmail: false,
                      controller: _phoneController,
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),

                    // For Remark
                    Text('Address', style: LatoSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.getTextColor(context))),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    CustomTextField(
                      hintTxt: 'address',
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      focusNode: _addressFocus,
                      isEmail: false,
                      controller: _addressController,
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),

                    // Button
                    !package.isLoading ?  Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () async {
                          String _name = _nameController.text.trim();
                          String _email = _emailController.text.trim();
                          String _phone = _phoneController.text.trim();
                          String _address = _addressController.text.trim();
                          if(Provider.of<PackageProvider>(context, listen: false).packageIndex == -1){
                            showCustomSnackBar(message: 'Select Package Type', context: context);
                          }else if (_name.isEmpty) {
                            showCustomSnackBar(message: 'Enter Name', context: context);
                          } else {
                            CustomerModel packageBody= CustomerModel(
                              name: _name,
                              type: Provider.of<PackageProvider>(context, listen: false).packageTypeList[Provider.of<PackageProvider>(context, listen: false).packageIndex].leaveType,
                              email: _email,
                              phone: _phone,
                              address: _address,
                            );


                            !widget.isUpdate ? DatabaseProvider.db.insert(packageBody).then((success) async {
                              Navigator.pop(context);
                              showCustomSnackBar(message: 'Store Successfully', context: context, isError: false);
                              package.addItem(packageBody);
                            }) : DatabaseProvider.db.update(widget.packageModel).then((success) async {
                              Navigator.pop(context);
                              showCustomSnackBar(message: 'Store Update Successfully', context: context, isError: false);
                              package.updateItem(packageBody, widget.index);
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorResources.getPrimaryBGColor(context), width: 1),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Text(widget.isUpdate ? 'Update' : 'Submit', style: LatoMedium.copyWith(color: ColorResources.getPrimaryBGColor(context)),),
                        ),
                      ),
                    ) : Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(ColorResources.COLOR_PRIMARY))),

                  ],
                )
            )
        ),
      ),
    );
  }
}




