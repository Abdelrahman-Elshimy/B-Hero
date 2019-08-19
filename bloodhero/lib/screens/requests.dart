import 'package:bloodhero/app_localizations.dart';
import 'package:bloodhero/screens/donors.dart';
import 'package:bloodhero/shared/location-icon.dart';
import 'package:bloodhero/shared/shared_styles.dart';
import 'package:bloodhero/util/blood-colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestsPage extends StatefulWidget {
  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  String localLang;
  BloodColors _bloodColors = new BloodColors();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      appBar: AppBar(

        centerTitle: false,
        title: Text(
          AppLocalizations.of(context).translate('requestsTitle'),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        ),
        backgroundColor: _bloodColors.mainColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Container(
            height: 23,
            width: 23,
            margin: EdgeInsets.only(right: 15, left: 15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    ExactAssetImage('assets/images/filter-results-button.png'),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 180,
            color: _bloodColors.mainColor,
            padding: EdgeInsets.only(top: 20),
             // create requests container
          child: Container(
            decoration: BoxDecoration(
              color: _bloodColors.mainColor,
            ),
            padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 20),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left:10, right: 10, top: 15, bottom: 15),
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
                              '976',
                              style: SharedStyles().numbersAndSomeStyle,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              AppLocalizations.of(context).translate('newRequest'),
                              style: SharedStyles().textAndSomeStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RequestsPage()));
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
                                    top: 10, bottom: 10, left: 30, right: 30),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  AppLocalizations.of(context)
                                      .translate('addRequest')
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
          )
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Transform.translate(
              offset: Offset(0, 120),
                        child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      color: Colors.white,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: ExactAssetImage(
                                            'assets/images/Mask Group 52.png')),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Roben Doz',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            LocationIcon(15.0),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Cairo',
                                              style:
                                                  TextStyle(color: Color(0xff666666)),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DonorsPage()));
                                          },
                                          child: Material(
                                            elevation: 0,
                                            borderRadius: BorderRadius.circular(20),
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  top: 7,
                                                  bottom: 7,
                                                  left: 20,
                                                  right: 20),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Color(0xffCCCCCC)),
                                                  borderRadius:
                                                      BorderRadius.circular(20)),
                                              child: Text(
                                                '01124841951',
                                                style: TextStyle(
                                                    color: _bloodColors.mainColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(15),
                                  padding: EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xffcccccc)),
                                      shape: BoxShape.circle),
                                  child: Text(
                                    'A+',
                                    style: TextStyle(
                                        color: _bloodColors.mainColor, fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  );
                },
                itemCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
