
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/data/model/body/leaveType.dart';
import 'package:real_state/data/model/response/package_model.dart';
import 'package:real_state/helper/sql_helper.dart';
import 'package:real_state/provider/package_provider.dart';
import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/dimensions.dart';
import 'package:real_state/utill/styles.dart';
import 'package:real_state/view/base/custom_appbar.dart';
import 'package:real_state/view/base/custom_snackbar.dart';
import 'package:real_state/view/base/textfeild/custom_textfeild.dart';
import 'package:real_state/view/screens/drawer/drawer_screen.dart';


class AddPackageScreen extends StatefulWidget {
  final bool isUpdate;
  final int index;
  final PackageModel packageModel;
  AddPackageScreen({this.isUpdate = false, this.index, this.packageModel});
  @override
  State<AddPackageScreen> createState() => _AddPackageScreenState();
}

class _AddPackageScreenState extends State<AddPackageScreen> {

  FocusNode _priceFocus = FocusNode();
  TextEditingController _priceController = TextEditingController();
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
      if (widget.packageModel.name == 'Economic') {
        Provider.of<PackageProvider>(context, listen: false).setPackageTypeIndex(0, false);
      } else if(widget.packageModel.name == 'Basic') {
        Provider.of<PackageProvider>(context, listen: false).setPackageTypeIndex(1, false);
      }else if(widget.packageModel.name == 'Family') {
        Provider.of<PackageProvider>(context, listen: false).setPackageTypeIndex(2, false);
      }else if(widget.packageModel.name == 'Bachelor') {
        Provider.of<PackageProvider>(context, listen: false).setPackageTypeIndex(3, false);
      }else if(widget.packageModel.name == 'Fast') {
        Provider.of<PackageProvider>(context, listen: false).setPackageTypeIndex(4, false);
      }else {
        Provider.of<PackageProvider>(context, listen: false).setPackageTypeIndex(5, false);
      }
    if(widget.packageModel.packageName == '2Mbps'){
      Provider.of<PackageProvider>(context, listen: false).setPackageNameIndex(0, false);
    }else if(widget.packageModel.packageName == '5Mbps') {
      Provider.of<PackageProvider>(context, listen: false).setPackageNameIndex(1, false);
    } else if(widget.packageModel.packageName == '8Mbps') {
      Provider.of<PackageProvider>(context, listen: false).setPackageNameIndex(2, false);
    }else if(widget.packageModel.packageName == '10Mbps') {
      Provider.of<PackageProvider>(context, listen: false).setPackageNameIndex(3, false);
    }else if(widget.packageModel.packageName == '15Mbps') {
      Provider.of<PackageProvider>(context, listen: false).setPackageNameIndex(4, false);
    }else{
      Provider.of<PackageProvider>(context, listen: false).setPackageNameIndex(5, false);
    }
    }else{
      Provider.of<PackageProvider>(context, listen: false).setPackageTypeIndex(-1, false);
      Provider.of<PackageProvider>(context, listen: false).setPackageNameIndex(-1, false);
      _priceController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _globalKey,
      backgroundColor: ColorResources.getBackgroundColor(context),
      appBar: CustomAppBar(title: 'ADD PACKAGE', onPressed: () => _globalKey.currentState.openDrawer(),),
      drawer: Drawer(child: CustomDrawer()),
      body: Form(
        key: _formKeyLogin,
        child: SafeArea(
            child: Consumer<PackageProvider>(
                builder: (context, package, child) => ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT, vertical: Dimensions.FONT_SIZE_SMALL),
                  children: [

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



                    // For PackageName
                    Text('PackageName', style: LatoSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.getTextColor(context))),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    Consumer<PackageProvider>(
                      builder: (context, package, child) => package.packageNameList != null ? package.packageNameList.length > 0 ? Container(
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: ColorResources.GREY, width: 1),
                        ),
                        child: DropdownButton<PackageTypeModel>(
                          underline: SizedBox(),
                          isExpanded: true,
                          hint: Text('Select Package', style: LatoRegular),
                          icon: Icon(CupertinoIcons.chevron_forward, size: 20, color: ColorResources.getHintColor(context)),
                          value: package.packageNameIndex == -1 ? null : package.packageNameList[package.packageNameIndex],
                          items: package.packageNameList.map((PackageTypeModel clientData) {
                            return DropdownMenuItem<PackageTypeModel>(
                              value: clientData,
                              child: Text(clientData.leaveType, style: LatoRegular, overflow: TextOverflow.ellipsis),
                            );
                          }).toList(),
                          onChanged: (PackageTypeModel clientData) {
                            int index = package.packageNameList.indexOf(clientData);
                            package.setPackageNameIndex(index, true);
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
                    Text('Price', style: LatoSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.getTextColor(context))),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    CustomTextField(
                      hintTxt: 'Price',
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      focusNode: _priceFocus,
                      isEmail: false,
                      controller: _priceController,
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),

                    // Button
                    !package.isLoading ?  Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () async {
                          String _remark = _priceController.text.trim();
                          if(Provider.of<PackageProvider>(context, listen: false).packageIndex == -1){
                            showCustomSnackBar(message: 'Select Package Type', context: context);
                          } else if (Provider.of<PackageProvider>(context, listen: false).packageNameIndex == -1) {
                            showCustomSnackBar(message: 'Select Package', context: context);
                          }else if (_remark.isEmpty) {
                            showCustomSnackBar(message: 'Enter Price', context: context);
                          } else {
                            PackageModel packageBody= PackageModel(
                              name: Provider.of<PackageProvider>(context, listen: false).packageTypeList[Provider.of<PackageProvider>(context, listen: false).packageIndex].leaveType,
                              packageName: Provider.of<PackageProvider>(context, listen: false).packageNameList[Provider.of<PackageProvider>(context, listen: false).packageNameIndex].leaveType,
                              price: int.parse(_remark),
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




