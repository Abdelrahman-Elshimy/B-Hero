import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        ExactAssetImage('assets/images/Mask Group 42.png'),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(
                        'Jym Ben',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                        child: Icon(
                          Icons.check,
                          size: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset('assets/images/clock.png'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '6min ago',
                            style: TextStyle(
                              color: Colors.grey.withOpacity(.7),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset('assets/images/Group 1047.png'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Cairo',
                            style: TextStyle(
                              color: Colors.grey.withOpacity(.7),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            ExactAssetImage('assets/images/Mask Group 44.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffEEEEEE)),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffEEEEEE)),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.share,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffEEEEEE)),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add_comment,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem',
                    style: TextStyle(
                      color: Color(0xffAAAAAA),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}