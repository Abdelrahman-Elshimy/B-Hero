import 'package:bloodhero/util/blood-colors.dart';
import 'package:flutter/material.dart';

class BloodGroup extends StatefulWidget {
  @override
  _BloodGroupState createState() => _BloodGroupState();
}

class _BloodGroupState extends State<BloodGroup> {
  BloodColors _bloodColors = BloodColors();
  String bloodGroup = 'aPlus';
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            if (bloodGroup != 'aPlus') {
                              setState(() {
                                bloodGroup = 'aPlus';
                              });
                            }
                          },
                          child: Container(
                              child: Container(
                            padding: EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: (bloodGroup == 'aPlus')
                                  ? _bloodColors.mainColor
                                  : Colors.white,
                              border: (bloodGroup != 'aPlus')
                                  ? Border.all(color: Color(0xffA2A2A2))
                                  : Border.all(color: Colors.transparent),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              'A+',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: (bloodGroup == 'aPlus')
                                      ? Colors.white
                                      : Color(0xffA2A2A2),
                                  fontSize: 15.5),
                            ),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            if (bloodGroup != 'aMinus') {
                              setState(() {
                                bloodGroup = 'aMinus';
                              });
                            }
                          },
                          child: Container(
                              child: Container(
                            padding: EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: (bloodGroup == 'aMinus')
                                  ? _bloodColors.mainColor
                                  : Colors.white,
                              border: (bloodGroup != 'aMinus')
                                  ? Border.all(color: Color(0xffA2A2A2))
                                  : Border.all(color: Colors.transparent),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              'A-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: (bloodGroup == 'aMinus')
                                      ? Colors.white
                                      : Color(0xffA2A2A2),
                                  fontSize: 15.5),
                            ),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            if (bloodGroup != 'bMinus') {
                              setState(() {
                                bloodGroup = 'bMinus';
                               
                              });
                            }
                          },
                          child: Container(
                              child: Container(
                            padding: EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: (bloodGroup == 'bMinus')
                                  ? _bloodColors.mainColor
                                  : Colors.white,
                              border: (bloodGroup != 'bMinus')
                                  ? Border.all(color: Color(0xffA2A2A2))
                                  : Border.all(color: Colors.transparent),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              'B-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: (bloodGroup == 'bMinus')
                                      ? Colors.white
                                      : Color(0xffA2A2A2),
                                  fontSize: 15.5),
                            ),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            if (bloodGroup != 'bPlus') {
                              setState(() {
                                bloodGroup = 'bPlus';
                               
                              });
                            }
                          },
                          child: Container(
                              child: Container(
                            padding: EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: (bloodGroup == 'bPlus')
                                  ? _bloodColors.mainColor
                                  : Colors.white,
                              border: (bloodGroup != 'bPlus')
                                  ? Border.all(color: Color(0xffA2A2A2))
                                  : Border.all(color: Colors.transparent),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              'B+',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: (bloodGroup == 'bPlus')
                                      ? Colors.white
                                      : Color(0xffA2A2A2),
                                  fontSize: 15.5),
                            ),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            if (bloodGroup != 'oPlus') {
                              setState(() {
                                bloodGroup = 'oPlus';
                               
                              });
                            }
                          },
                          child: Container(
                              child: Container(
                            padding: EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: (bloodGroup == 'oPlus')
                                  ? _bloodColors.mainColor
                                  : Colors.white,
                              border: (bloodGroup != 'oPlus')
                                  ? Border.all(color: Color(0xffA2A2A2))
                                  : Border.all(color: Colors.transparent),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              'O+',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: (bloodGroup == 'oPlus')
                                      ? Colors.white
                                      : Color(0xffA2A2A2),
                                  fontSize: 15.5),
                            ),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: InkWell(
                          onTap: () {
                            if (bloodGroup != 'oMinus') {
                              setState(() {
                                bloodGroup = 'oMinus';
                               
                              });
                            }
                          },
                          child: Container(
                              child: Container(
                            padding: EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: (bloodGroup == 'oMinus')
                                  ? _bloodColors.mainColor
                                  : Colors.white,
                              border: (bloodGroup != 'oMinus')
                                  ? Border.all(color: Color(0xffA2A2A2))
                                  : Border.all(color: Colors.transparent),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              'O-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: (bloodGroup == 'oMinus')
                                      ? Colors.white
                                      : Color(0xffA2A2A2),
                                  fontSize: 15.5),
                            ),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            if (bloodGroup != 'abPlus') {
                              setState(() {
                                bloodGroup = 'abPlus';
                               
                              });
                            }
                          },
                          child: Container(
                              child: Container(
                            padding: EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: (bloodGroup == 'abPlus')
                                  ? _bloodColors.mainColor
                                  : Colors.white,
                              border: (bloodGroup != 'abPlus')
                                  ? Border.all(color: Color(0xffA2A2A2))
                                  : Border.all(color: Colors.transparent),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              'AB+',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: (bloodGroup == 'abPlus')
                                      ? Colors.white
                                      : Color(0xffA2A2A2),
                                  fontSize: 15.5),
                            ),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            if (bloodGroup != 'abMinus') {
                              setState(() {
                                bloodGroup = 'abMinus';
                               
                              });
                            }
                          },
                          child: Container(
                              child: Container(
                            padding: EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: (bloodGroup == 'abMinus')
                                  ? _bloodColors.mainColor
                                  : Colors.white,
                              border: (bloodGroup != 'abMinus')
                                  ? Border.all(color: Color(0xffA2A2A2))
                                  : Border.all(color: Colors.transparent),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              'AB-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: (bloodGroup == 'abMinus')
                                      ? Colors.white
                                      : Color(0xffA2A2A2),
                                  fontSize: 15.5),
                            ),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                     Expanded(
                      child: Container(),
                    ),
                     Expanded(
                      child: Container(),
                    ),
                     Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}