import 'package:bloodhero/app_localizations.dart';
import 'package:bloodhero/util/blood-colors.dart';
import 'package:bloodhero/shared/shared_styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      drawer: Drawer(),
      body: ListView(
        children: <Widget>[
          // create donors container
          Container(
            padding: EdgeInsets.all(20),
            color: _bloodColors.mainColor,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
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
                          onTap: () {},
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
                  padding: EdgeInsets.all(20),
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
                          onTap: () {},
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
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)
                        .translate('explorFeed')
                        .toUpperCase(),
                    style: SharedStyles().smallMainTitleStyle,
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: _bloodColors.mainColor,
                            shape: BoxShape.circle),
                        child: Text(
                          '+',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Container(
                        child: Text(
                          AppLocalizations.of(context).translate('postUpdate'),
                          style: TextStyle(
                            color: _bloodColors.mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
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
          ),
          Divider(),

          Container(
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
          ),
        ],
      ),
      // drawer: Drawer(),
    );
  }
}
