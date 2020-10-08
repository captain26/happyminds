import 'package:flutter/material.dart';
class UserInfo extends StatelessWidget {
  final String name;
  final String about;
  final ImageProvider photo;
  final String price;

  UserInfo({this.name, this.about, this.photo, this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Image(
                      image: photo,
                      height: 55,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                          color: Color(0xff072ac8),
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        about,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                price,
                style: TextStyle(
                  color: Color(0xff393e41),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 30),
            child: SizedBox(
              height: 2,
              child: Divider(
                color: Color(0xffa2d6f9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
