import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DataView extends StatelessWidget {

  DataView({this.percentage,this.icon});

  final String icon;
  final int percentage;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal : 8.0,vertical: 5.0),
      child: Row(
        children: [
         SvgPicture.asset(icon),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal : 8.0,vertical: 5.0),
            child: Text('$percentage%',
            style: TextStyle(color: Color(0xff072ac8),fontWeight: FontWeight.w700),),
          ),
        ],
      ),
    );
  }
}
