import 'package:bloodhero/app_localizations.dart';
import 'package:bloodhero/shared/blood-group.dart';
import 'package:bloodhero/util/blood-colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloodhero/shared/shared_styles.dart';

class BeDonorPage extends StatefulWidget {
  @override
  _BeDonorPageState createState() => _BeDonorPageState();
}

class _BeDonorPageState extends State<BeDonorPage> {
  // create form key
  final _formKey = GlobalKey<FormState>();
  BloodColors _bloodColors = new BloodColors();
  bool _isMan = true;
  bool _numberVisible = false;
  String email;
  String name;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: _bloodColors.mainColor)),
        ),
        title: Text(
          AppLocalizations.of(context).translate('bedonorTitle'),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: _bloodColors.bGrey,
                              contentPadding: EdgeInsets.only(
                                  left: 20,
                                  top: (localLang == 'ar') ? 8 : 15,
                                  bottom: 15,
                                  right: 20),
                              hintText: AppLocalizations.of(context).translate('donorName'),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: _bloodColors.bGrey, width: 5.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: _bloodColors.bGrey, width: 5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: _bloodColors.bGrey, width: 5.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: _bloodColors.bGrey, width: 5.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: _bloodColors.bGrey, width: 5.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: _bloodColors.bGrey, width: 5.0),
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return AppLocalizations.of(context).translate('nameError');
                              }
                              if (value.length < 6) {
                                return AppLocalizations.of(context).translate('nameCount');
                              }
                              return null;
                            },
                            onSaved: (nameValue) {
                              setState(() {
                                name = nameValue;
                              });
                            },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: _bloodColors.bGrey,
                              contentPadding: EdgeInsets.only(
                                  left: 20,
                                  top: (localLang == 'ar') ? 8 : 15,
                                  bottom: 15,
                                  right: 20),
                              hintText: AppLocalizations.of(context).translate('donorEmail'),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: _bloodColors.bGrey, width: 5.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: _bloodColors.bGrey, width: 5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: _bloodColors.bGrey, width: 5.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: _bloodColors.bGrey, width: 5.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: _bloodColors.bGrey, width: 5.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: _bloodColors.bGrey, width: 5.0),
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return AppLocalizations.of(context).translate('emailError');
                              }
                              return null;
                            },
                            onSaved: (emailValue) {
                              setState(() {
                                email = emailValue;
                              });
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 10),
                    child: Text(
                      AppLocalizations.of(context).translate('gender'),
                      style: SharedStyles().smallMainTitleStyle,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 40,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isMan = true;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: (_isMan)
                                          ? AssetImage(
                                              'assets/images/man (5).png')
                                          : AssetImage(
                                              'assets/images/man (6).png'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            (!_isMan)
                                ? Text(
                                    AppLocalizations.of(context).translate('male'),
                                    style: TextStyle(color: Color(0xffA2A2A2)),
                                  )
                                : Text(
                                    AppLocalizations.of(context).translate('male'),
                                    style: TextStyle(
                                        color: _bloodColors.mainColor),
                                  ),
                          ],
                        ),
                      ),
                      Transform.translate(
                          offset: Offset(0, -5),
                          child: SizedBox(
                            height: 30,
                            width: 2,
                            child: Container(
                              color: Color(0xffCCCCCC),
                            ),
                          )),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 40,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isMan = false;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: (_isMan)
                                          ? AssetImage(
                                              'assets/images/woman (2).png')
                                          : AssetImage(
                                              'assets/images/woman (1).png'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            (_isMan)
                                ? Text(
                                    AppLocalizations.of(context).translate('female'),
                                    style: TextStyle(color: Color(0xffA2A2A2)),
                                  )
                                : Text(
                                    AppLocalizations.of(context).translate('female'),
                                    style: TextStyle(
                                        color: _bloodColors.mainColor),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 20, bottom: 0, right: 10),
                    child: Text(
                      AppLocalizations.of(context).translate('selectBloodGroup'),
                      style: SharedStyles().smallMainTitleStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // create blood group
          BloodGroup(),

          // check if user want to make his number visible
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if (_numberVisible) {
                      setState(() {
                        _numberVisible = false;
                      });
                    } else {
                      setState(() {
                        _numberVisible = true;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: (!_numberVisible)
                            ? Border.all(color: Color(0xffA2A2A2))
                            : Border.all(color: Colors.transparent),
                        color: (_numberVisible) ? Colors.green : Colors.white,
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.check,
                      size: 13,
                      color: (_numberVisible) ? Colors.white : Color(0xffA2A2A2),
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                      AppLocalizations.of(context).translate('numberVisibleMessage'), style: TextStyle(color: Color(0xff666666), letterSpacing: 1.2),),
                ))
              ],
            ),
          ),
          // submit button
          GestureDetector(
            onTap: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                
              }
            },
            child: Container(
              height: 45,
              margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: _bloodColors.mainColor),
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  AppLocalizations.of(context).translate('done').toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
