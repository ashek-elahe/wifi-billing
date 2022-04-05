import 'package:flutter/material.dart';
import 'package:real_state/data/model/response/package_model.dart';
import 'package:real_state/utill/color_resources.dart';
import 'package:real_state/utill/dimensions.dart';
import 'package:real_state/utill/styles.dart';

class LeaveView extends StatefulWidget {
  final PackageModel packageModel;
  final int index;
  LeaveView({@required this.packageModel, this.index});

  @override
  _LeaveViewState createState() => _LeaveViewState();
}

class _LeaveViewState extends State<LeaveView> {
  bool _animate = false;
  static bool _isStart = true;

  @override
  void initState() {
    super.initState();
    _isStart ? Future.delayed(Duration(milliseconds: widget.index * 100), () {
      setState(() {
        _animate = true;
        _isStart = false;
      });
    }) : _animate = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // bool isPending = false;
    // if(widget.packageModel.status == 'Pending'){
    //   isPending = true;
    // }else{
    //   isPending = false;
    // }

    return AnimatedOpacity(
      duration: Duration(milliseconds: 1000),
      opacity: _animate ? 1 : 0,
      curve: Curves.easeInOutQuart,
      child: AnimatedPadding(
          duration: Duration(milliseconds: 1000),
          padding: _animate ? const EdgeInsets.all(4.0) : const EdgeInsets.only(top: 10),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(
                    alignment: Alignment.center,
                   // margin: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL, vertical: Dimensions.PADDING_SIZE_SMALL),
                    decoration: BoxDecoration(
                      color: ColorResources.getPrimaryColor(context),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                      boxShadow: [BoxShadow(
                          offset: Offset(1,3),
                          color: ColorResources.getSecondaryColor(context),
                          spreadRadius: 0.5,
                          blurRadius: 0.5
                      )],
                    ),
                    child: Column(
                      children: [

                        Text(
                            '${widget.packageModel.name ?? ''}',
                            style: LatoBold.copyWith( color: ColorResources.WHITE,fontSize: Dimensions.FONT_SIZE_LARGE),
                            maxLines: 1, overflow: TextOverflow.ellipsis),
                        Text(
                            '${widget.packageModel.packageName ?? ''}',
                            style: LatoRegular.copyWith(
                                color: ColorResources.WHITE,
                                fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE), maxLines: 1, overflow: TextOverflow.ellipsis
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    //margin: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL, vertical: Dimensions.PADDING_SIZE_SMALL),
                    decoration: BoxDecoration(
                      color: ColorResources.getSecondaryColor(context),
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
                      boxShadow: [BoxShadow(
                          offset: Offset(1,3),
                          color: ColorResources.getSecondaryColor(context),
                          spreadRadius: 0.5,
                          blurRadius: 0.5
                      )],
                    ),
                    child: Column( crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Row(
                          children: [
                            Icon(Icons.wifi, size: 40, color: Colors.white,),
                            SizedBox(width: 5,),
                            Text(
                                'Unlimited Data',
                                style: LatoBold.copyWith( color: ColorResources.WHITE,fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                          ],
                        ),

                        Row( crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                '৳${widget.packageModel.price}',
                                style: LatoRegular.copyWith(color: ColorResources.WHITE, fontSize: 26),
                                maxLines: 2, overflow: TextOverflow.ellipsis
                            ),
                            SizedBox(width: 5,),
                            Text(
                                '/ Month',
                                style: LatoRegular.copyWith(color: ColorResources.WHITE, fontSize: 15),
                                maxLines: 2, overflow: TextOverflow.ellipsis
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),


                ],
              ),

              // Positioned(bottom: 5, right: 5,
              //   child:  Container(
              //     alignment: Alignment.center,
              //     padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              //     decoration: BoxDecoration(
              //       color: ColorResources.WHITE,
              //       borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), topLeft: Radius.circular(12)),
              //       boxShadow: [BoxShadow(
              //           offset: Offset(1,3),
              //           color: ColorResources.getHintColor(context).withOpacity(0.4),
              //           spreadRadius: 0.5,
              //           blurRadius: 0.5
              //       )],
              //     ),
              //     child: Text('5% Discount',
              //         style: LatoBold.copyWith( color: ColorResources.COLOR_PRIMARY,fontSize: Dimensions.FONT_SIZE_SMALL),
              //         maxLines: 1, overflow: TextOverflow.ellipsis
              //     ),
              //   ),)
            ],
          ),
      ),
    );
  }
}
