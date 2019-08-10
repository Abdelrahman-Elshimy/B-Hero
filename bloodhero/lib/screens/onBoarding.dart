import 'package:bloodhero/app_localizations.dart';
import 'package:bloodhero/models/Walkthrought.dart';
import 'package:bloodhero/screens/login_register.dart';
import 'package:bloodhero/util/blood-colors.dart';
import 'package:bloodhero/util/shared-styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
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
  SharedStyles _sharedStyles = new SharedStyles();
  int curentIndex = 0;

  // create indicators
  List<Widget> _drawIndicatorsMap() {
    List<Widget> list = [];
    for (int x = 0; x < 3; x++) {
      list.add(Container(
        width: 6,
        height: 6,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ));
    }

    for (int i = 0; i < 3; i++) {
      list[curentIndex] = Container(
        width: 14,
        height: 6,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(14)),
      );
    }
    return list;
  }

  // draw indicators
  Widget _drawIndicators() {
    return Positioned(
      bottom: 20,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _drawIndicatorsMap(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // create list from walk throught
    List<WalkThrougth> walkPages = [
      new WalkThrougth(
        title: AppLocalizations.of(context).translate('titlePageOne'),
        image: 'assets/images/blood-transfusion (1).png',
        description: AppLocalizations.of(context).translate('contentPageOne'),
      ),
      new WalkThrougth(
        title: AppLocalizations.of(context).translate('titlePageTwo'),
        image: 'assets/images/blood-transfusion.png',
        description: AppLocalizations.of(context).translate('contentPageTwo'),
      ),
      new WalkThrougth(
        title: AppLocalizations.of(context).translate('titlePageThree'),
        image: 'assets/images/blood-bag.png',
        description: AppLocalizations.of(context).translate('contentPageThree'),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            curentIndex = index;
          });
        },
        itemCount: walkPages.length,
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              Center(
                child: Transform.translate(
                  offset: Offset(0, -20),
                  child: (index != 0)
                      ? Container(
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              height: 210,
                              width: 210,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffCCCCCC)),
                                shape: BoxShape.circle,
                                color: Color(0xffF6F6F6),
                                image: DecorationImage(
                                  image:
                                      ExactAssetImage(walkPages[index].image),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      ExactAssetImage(walkPages[index].image),
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.only(top: 30),
                    height: MediaQuery.of(context).size.height * .34,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: _bloodColors.mainColor,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Text(walkPages[index].title,
                                  textAlign: TextAlign.center,
                                  style: _sharedStyles.onBoardingMainStyle()),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                walkPages[index].description,
                                textAlign: TextAlign.center,
                                style: _sharedStyles.onBoardingSubStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
              _drawIndicators(),
              (index == 2)
                  ? Positioned(
                      right: (localLang != 'ar') ? 0 : 0,
                      bottom: 10,
                      child: Transform.translate(
                        offset: Offset(20, 0),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 30, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginRegisterPage()));
                            },
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate('getStarted'),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}
