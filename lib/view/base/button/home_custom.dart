import 'package:real_state/utill/styles.dart';
import 'package:flutter/material.dart';

class HomeCustomBtn extends StatelessWidget {
  final Function onClick;
  final String txt;
  HomeCustomBtn({@required this.onClick,this.txt});
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.blue[400],
                Colors.blue,
                Colors.blue[400]
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight
          ),
          borderRadius: BorderRadius.circular(50)
      ),
      child: TextButton(
        onPressed: onClick,
        child: Text(txt,style: LatoSemiBold.copyWith(color: Colors.white,fontSize: 20)),
      ),
    );
  }
}
