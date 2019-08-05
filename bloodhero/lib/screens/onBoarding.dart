import 'package:bloodhero/models/Walkthrought.dart';
import 'package:bloodhero/screens/home.dart';
import 'package:bloodhero/util/blood-colors.dart';
import 'package:bloodhero/util/shared-styles.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  // create list from walk throught
  List<WalkThrougth> walkPages = [
    new WalkThrougth(
      title: 'Donate Blood',
      image: 'assets/images/blood-transfusion (1).png',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting',
    ),
    new WalkThrougth(
      title: 'Search Blood Donor',
      image: 'assets/images/blood-transfusion.png',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting',
    ),
    new WalkThrougth(
        title: '', image: 'assets/images/blood-bag.png', description: ''),
  ];
  BloodColors _bloodColors = new BloodColors();
  SharedStyles _sharedStyles = new SharedStyles();
  int curentIndex = 0;

  // create indicators
  List<Widget> _drawIndicatorsMap() {
    List<Widget> list = [];
    for (int x =0; x < 3; x++) {
      list.add(Container(
        width: 7,
        height: 7,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ));
    }

    for (int i = 0; i < walkPages.length; i++) {
      list[curentIndex] = Container(
        width: 14,
        height: 7,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14)
        ),
      );
    }
    return list;
  }

  // draw indicators
  Widget _drawIndicators() {
    if (curentIndex != 2) {
      return Positioned(
        bottom: 10,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _drawIndicatorsMap(),
          ),
        ),
      );
    }
    return Container();
  }

  // make shape
  Widget _shape(index) {
    if (index != 2) {
      return Container(
        padding: EdgeInsets.only(top: 30),
        height: MediaQuery.of(context).size.height * .34,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: (index == 0)
              ? BorderRadius.only(topLeft: Radius.circular(100))
              : BorderRadius.only(topLeft: Radius.circular(0)),
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
      );
    }
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20, left: 20),
      color: BloodColors().mainColor,
      width: MediaQuery.of(context).size.width - 40,
      child: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return MyHomePage();
            }));
          },
          child: Text(
            'GET STARTED',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              Transform.translate(
                offset: Offset(0, -20),
                child: Container(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage(walkPages[index].image),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: _shape(index),
              ),
              _drawIndicators(),
            ],
          );
        },
      ),
    );
  }
}
