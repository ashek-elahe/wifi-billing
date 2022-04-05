import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/data/model/response/customer_model.dart';
import 'package:real_state/helper/user_helper.dart';
import 'package:real_state/provider/customer_provider.dart';
import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/dimensions.dart';
import 'package:real_state/utill/styles.dart';
import 'package:real_state/view/base/custom_appbar.dart';
import 'package:real_state/view/base/no_data_screen.dart';
import 'package:real_state/view/screens/customer/widget/customer_view.dart';
import 'package:real_state/view/screens/drawer/drawer_screen.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import 'add_customer.dart';

class CustomerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Provider.of<CustomerProvider>(context, listen: false).refreshNote();
    GlobalKey<ScaffoldState> _globalKey = GlobalKey();
    return Scaffold(
      key: _globalKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorResources.getBackgroundColor(context),
      appBar: CustomAppBar(title: 'CUSTOMER LIST',  onPressed: () => _globalKey.currentState.openDrawer(),),
      drawer: Drawer(child: CustomDrawer()),
      body: SafeArea(
        child: Consumer<CustomerProvider>(
          builder: (context, attend, child) {
            return  attend.customerList != null ?  RefreshIndicator(
              onRefresh: () async {
                await  Provider.of<CustomerProvider>(context, listen: false).refreshNote();
              },
              backgroundColor: ColorResources.COLOR_PRIMARY,
              color: ColorResources.WHITE,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 35,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 5, right: 5, top: 5 ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            cursorColor: Colors.grey.shade500,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(bottom: 10),
                              hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: Dimensions.FONT_SIZE_LARGE),
                              hintText: 'Search Package...',
                              border: InputBorder.none,
                              prefixIcon: const Icon(CupertinoIcons.search, color: Colors.black,),
                            ),
                            onChanged: (text){
                              attend.searchQuery(text);
                            },
                            style: Theme.of(context).textTheme.bodyText1.copyWith(color: CupertinoColors.black, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      PopupMenuButton(
                          child: Icon(Icons.filter_alt_sharp),
                          itemBuilder: (_) => const<PopupMenuItem<int>>[
                            PopupMenuItem<int>(
                                child: Text('A-Z by Name'), value: 0),
                            PopupMenuItem<int>(
                                child: Text('Z-A by Name'), value: 1),
                          ],
                          onSelected: (int value)  {
                            attend.sort(value==0);
                          }),
                      SizedBox(width: 10,)
                    ],
                  ),
                  attend.customerList.length > 0 ?  Expanded(
                    child: ListView.builder(
                        itemCount: attend.customerList.length,
                        padding: EdgeInsets.only(
                            left: 12, right: 12, top: 10, bottom: 5),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () => showFoodDialog(context, attend.customerList[index], index),
                              child: CustomerView(customerModel: attend.customerList[index], index: index));
                        }),
                  )  : NoDataScreen(),
                ],
              ),
            )

                : AttendanceShimmer();
          },
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70,
        color: ColorResources.getBackgroundColor(context),
        child: Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => AddCustomerScreen(isUpdate: false)));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: ColorResources.getPrimaryBGColor(context), width: 1),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Text('Add Customer', style: LatoMedium.copyWith(color: ColorResources.getPrimaryBGColor(context)),),
            ),
          ),
        ),
      ),

    );
  }
}




class AttendanceShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Shimmer(
          color: ColorResources.getGreyColor(context),
          duration: Duration(seconds: 1),
          enabled:  null,
          child: Container(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            margin: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[200], spreadRadius: 1, blurRadius: 5)
              ],
              color: ColorResources.WHITE,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: ColorResources.getGreyColor(context),
                      height: 10,
                      width: 200,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: ColorResources.getGreyColor(context),
                      height: 10,
                      width: 110,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: ColorResources.getGreyColor(context),
                      height: 10,
                      width: 90,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}


showFoodDialog(BuildContext context, CustomerModel packageModel, int index) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(packageModel.name),
      content: Text("ID ${packageModel.id}"),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AddCustomerScreen(packageModel: packageModel, isUpdate: true, index: index),
            ),
          ),
          child: Text("Update"),
        ),
        TextButton(
          onPressed: () => DatabaseProvider.db.delete(packageModel.id).then((_) {
            Provider.of<CustomerProvider>(context, listen: false).removeItem(index);
            Navigator.pop(context);
          }),
          child: Text("Delete"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
      ],
    ),
  );
}
