import 'package:bloodhero/screens/verify_number.dart';
import 'package:bloodhero/shared/shared_styles.dart';
import 'package:bloodhero/util/blood-colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bloodhero/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          // create top section contain the image and color
          Container(
            height: MediaQuery.of(context).size.height * .4,
            decoration: BoxDecoration(
              color: BloodColors().mainColor,
              image: DecorationImage(
                image: ExactAssetImage('assets/images/Artboard 1@2x.png'),
              ),
            ),
          ),
          // container that contain all types of login and register
          Container(
            width: MediaQuery.of(context).size.width * .7,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .087),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                      AppLocalizations.of(context).translate('homeTitle'),
                      style: SharedStyles().mainTitleStyle),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Stack(
                    children: <Widget>[
                      // facebook login and register
                      Container(
                        width: MediaQuery.of(context).size.width * .7,
                        padding: (localLang == 'ar') ? EdgeInsets.all(13) :EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color(0xff2D509B),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          AppLocalizations.of(context).translate('facebook'),
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: (localLang == 'ar') ? 17 : 15,
                        child: Container(
                          child: Icon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                // google login and register
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * .7,
                        padding: (localLang == 'ar') ? EdgeInsets.all(13) :EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black12,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          AppLocalizations.of(context).translate('google'),
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: (localLang == 'ar') ? 18 : 17,
                        child: Container(
                          child: Icon(
                            FontAwesomeIcons.google,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                // Mobil Number login and register
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerifyNumber()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * .7,
                          padding: (localLang == 'ar') ? EdgeInsets.all(13) :EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black12,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            AppLocalizations.of(context)
                                .translate('mobileNumber'),
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: (localLang == 'ar') ? 19 : 17,
                        child: Container(
                          child: Icon(
                            Icons.apps,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
