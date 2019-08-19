import 'package:bloodhero/app_localizations.dart';
import 'package:bloodhero/shared/location-icon.dart';
import 'package:bloodhero/shared/middle-container.dart';
import 'package:bloodhero/shared/post.dart';
import 'package:bloodhero/util/blood-colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  // get local language
  String localLang;

  Future checkLocalStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      localLang = prefs.getString('local');
    });
  }

  @override
  void initState() {
    super.initState();

    checkLocalStatus();
  }
  
  BloodColors _bloodColors = new BloodColors();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.black45)),
        ),
        centerTitle: false,
        title: Row(
          children: <Widget>[
            Text(
              'JItendra Root',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              padding: EdgeInsets.all(1),
              decoration:
                  BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              child: Icon(
                Icons.check,
                size: 13,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: GestureDetector(
              child: Text(
                AppLocalizations.of(context).translate('more').toUpperCase(),
                style: TextStyle(
                  color: _bloodColors.mainColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15, top: 10, bottom: 20),
            child: Row(
              children: <Widget>[
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xffCCCCCC), width: 3)),
                  child: CircleAvatar(
                    backgroundImage:
                        ExactAssetImage('assets/images/Mask Group 53.png'),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  '4',
                                  style: TextStyle(
                                      color: _bloodColors.mainColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(AppLocalizations.of(context)
                                    .translate('donated')
                                    .toUpperCase()),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  '124',
                                  style: TextStyle(
                                      color: _bloodColors.mainColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(AppLocalizations.of(context)
                                    .translate('requests')
                                    .toUpperCase()),
                              ],
                            ),
                            Transform.translate(
                              offset: (localLang == 'en') ? Offset(0, -1) : Offset(0, -2),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.favorite_border,
                                    size: 13,
                                    color: _bloodColors.mainColor,
                                    
                                  ),
                                  SizedBox(
                                    height:  (localLang == 'en') ? 5 : 10,
                                  ),
                                  Text('23'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                    color: _bloodColors.mainColor,
                                    borderRadius: BorderRadius.circular(40)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      size: 17,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate('heroDonor')
                                          .toUpperCase(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xffCCCCCC)),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  AppLocalizations.of(context)
                                      .translate('myAccount')
                                      .toUpperCase(),
                                  style: TextStyle(
                                      color: _bloodColors.mainColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                LocationIcon(17.0),
                SizedBox(
                  width: 10,
                ),
                Text('Cairo'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            child: Text(
              'Lorem Ipsum has been the industry\'s standard  dummy text ever since the 1500s',
              style: TextStyle(color: Color(0xffAAAAAA)),
            ),
          ),
          Divider(),
          MiddleContainer(AppLocalizations.of(context).translate('myActivity')),
          SizedBox(
            height: 10,
          ),
          Divider(),
          PostCard(),
          Divider(),
          PostCard(),
        ],
      ),
    );
  }
}
