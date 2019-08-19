import 'package:bloodhero/app_localizations.dart';
import 'package:bloodhero/shared/location-icon.dart';
import 'package:bloodhero/util/blood-colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonorsPage extends StatefulWidget {
  @override
  _DonorsPageState createState() => _DonorsPageState();
}

class _DonorsPageState extends State<DonorsPage> {
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
          AppLocalizations.of(context).translate('donorsTitle'),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        backgroundColor: Colors.white,
        elevation: 4,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: _bloodColors.mainColor,
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
                    ExactAssetImage('assets/images/filter-results-button-red.png'),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            
            margin: EdgeInsets.only(top: 10),
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
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Roben Doz',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
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
                                    style: TextStyle(color: Color(0xff666666)),
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
                                          builder: (context) => DonorsPage()));
                                },
                                child: Material(
                                  elevation: 0,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 7, bottom: 7, left: 30, right: 30),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Color(0xffCCCCCC)),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .translate('askHelp'),
                                      style: TextStyle(
                                          color: _bloodColors.mainColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
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
                  (index % 2 == 0) ?Container(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 7, bottom: 7),
                    width: double.infinity,
                    color: _bloodColors.mainColor,
                    child: Text(
                      AppLocalizations.of(context).translate('lastDonation'),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ) :Container(),
                ],
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
