import 'package:flutter/material.dart';

class DocInfo extends StatelessWidget {

  const DocInfo({Key key, this.doctorName, this.doctorProfession, this.asset}) : super(key: key);

  final String doctorName;
  final String doctorProfession;
  final String asset;



  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 25,vertical: 8.0),
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(image: AssetImage(asset)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctorName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                Text(doctorProfession,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
              ],
            ),
            Image(image: AssetImage('icons/bookapointment.png')),
          ],
        ),
      ),
    );
  }
}
