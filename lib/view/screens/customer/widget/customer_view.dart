import 'package:real_state/utill/images.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:real_state/data/model/response/customer_model.dart';
import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/dimensions.dart';
import 'package:real_state/utill/styles.dart';

class CustomerView extends StatefulWidget {
  final CustomerModel customerModel;
  final int index;
  CustomerView({@required this.customerModel, this.index});

  @override
  _CustomerViewState createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  bool _animate = false;

  static bool _isStart = true;

  @override
  void initState() {
    super.initState();
    _isStart
        ? Future.delayed(Duration(milliseconds: widget.index * 100), () {
      setState(() {
        _animate = true;
        _isStart = false;
      });
    })
        : _animate = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _contactNumber='tel: ${03074006526}';
    return AnimatedOpacity(
      duration: Duration(milliseconds: 1000),
      opacity: _animate ? 1 : 0,
      curve: Curves.easeInOutQuart,
      child: AnimatedPadding(
          duration: Duration(milliseconds: 1000),
          padding: _animate ? const EdgeInsets.all(4.0) : const EdgeInsets.only(top: 10),
          child: Container(
            constraints: BoxConstraints.expand(height: 100),
            alignment: Alignment.center,
             margin: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
             padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
             decoration: BoxDecoration(
              color: ColorResources.getPrimaryColor(context),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(
                  offset: Offset(1,3),
                  color: ColorResources.getSecondaryColor(context),
                  spreadRadius: 0.5,
                  blurRadius: 0.5
              )],

            ),
            child: Row( crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Image.asset(Images.profile, height: 30, width: 30,),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.customerModel.name ?? '',
                          style: LatoBold.copyWith( color: ColorResources.WHITE,fontSize: Dimensions.FONT_SIZE_LARGE),
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      Text(widget.customerModel.type ?? '',
                          style: LatoBold.copyWith( color: ColorResources.WHITE,fontSize: Dimensions.FONT_SIZE_DEFAULT),
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      Text(
                          '${widget.customerModel.email ?? ''}',
                          style: LatoRegular.copyWith(
                              color: ColorResources.WHITE,
                              fontSize: Dimensions.FONT_SIZE_SMALL), maxLines: 2, overflow: TextOverflow.ellipsis
                      ),
                      Text(
                          '${widget.customerModel.phone ?? ''}',
                          style: LatoRegular.copyWith(
                              color: ColorResources.WHITE,
                              fontSize: Dimensions.FONT_SIZE_SMALL), maxLines: 2, overflow: TextOverflow.ellipsis
                      ),
                      Text(
                          '${widget.customerModel.address ?? ''}',
                          style: LatoRegular.copyWith(
                              color: ColorResources.WHITE,
                              fontSize: Dimensions.FONT_SIZE_SMALL), maxLines: 2, overflow: TextOverflow.ellipsis
                      ),

                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await canLaunch(_contactNumber)
                        ? await launch(_contactNumber)
                        : throw 'Could not launch $_contactNumber';
                  },
                  child: CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.call_end),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
