import 'package:bloodhero/app_localizations.dart';
import 'package:bloodhero/screens/add_request.dart';
import 'package:bloodhero/screens/be-donor.dart';
import 'package:bloodhero/screens/donors.dart';
import 'package:bloodhero/screens/profile.dart';
import 'package:bloodhero/screens/requests.dart';
import 'package:bloodhero/shared/middle-container.dart';
import 'package:bloodhero/shared/post.dart';
import 'package:bloodhero/util/blood-colors.dart';
import 'package:bloodhero/shared/shared_styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey _drawerKey = GlobalKey();
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
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: _bloodColors.mainColor,
        title: Text('B HERO'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        key: _drawerKey,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: Container(
                  color: _bloodColors.mainColor,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'My Profile',
                    style: TextStyle(color: _bloodColors.bGrey, fontSize: 17),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BeDonorPage()));
                },
                child: Container(
                  color: _bloodColors.mainColor,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Be Donor',
                    style: TextStyle(color: _bloodColors.bGrey, fontSize: 17),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddRequest()));
                },
                child: Container(
                  color: _bloodColors.mainColor,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'New Request',
                    style: TextStyle(color: _bloodColors.bGrey, fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          // create donors container
          Container(
            padding: EdgeInsets.all(15),
            color: _bloodColors.mainColor,
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                  decoration: BoxDecoration(
                    color: _bloodColors.subMainColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '120966',
                              style: SharedStyles().numbersAndSomeStyle,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              AppLocalizations.of(context).translate('donors'),
                              style: SharedStyles().textAndSomeStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DonorsPage()));
                          },
                          child: Align(
                            alignment: (localLang != 'ar')
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Material(
                              elevation: 6,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 7, bottom: 7, left: 30, right: 30),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  AppLocalizations.of(context)
                                      .translate('findDonor')
                                      .toUpperCase(),
                                  style: TextStyle(
                                      color: _bloodColors.mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // create requests container
          Container(
            decoration: BoxDecoration(
              color: _bloodColors.mainColor,
            ),
            padding: EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 20),
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _bloodColors.subMainColor,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '120966',
                              style: SharedStyles().numbersAndSomeStyle,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              AppLocalizations.of(context).translate('request'),
                              style: SharedStyles().textAndSomeStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RequestsPage()));
                          },
                          child: Align(
                            alignment: (localLang != 'ar')
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Material(
                              elevation: 6,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 7, bottom: 7, left: 30, right: 30),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  AppLocalizations.of(context)
                                      .translate('seeRequest')
                                      .toUpperCase(),
                                  style: TextStyle(
                                      color: _bloodColors.mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          MiddleContainer(AppLocalizations.of(context).translate('explorFeed')),
          Divider(),
          PostCard(),
          Divider(),
          PostCard(),
        ],
      ),
      // drawer: Drawer(),
    );
  }
}
