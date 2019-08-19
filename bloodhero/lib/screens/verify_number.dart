import 'package:bloodhero/app_localizations.dart';
import 'package:bloodhero/screens/home.dart';
import 'package:bloodhero/shared/shared_styles.dart';
import 'package:bloodhero/util/blood-colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyNumber extends StatefulWidget {
  @override
  _VerifyNumberState createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
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

  final _verifyForm = GlobalKey<FormState>();
  final _formConfirm = GlobalKey();

  // TextEditingController _controllerDialog = TextEditingController();

  Future<String> popUpConfirmation(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 3,
          key: _formConfirm,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.normal, color: Colors.black, fontSize: 16),
          content: Container(
            height: MediaQuery.of(context).size.height * .32,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Confirm verfication code', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(height: 20,),
                Form(
                  key: _verifyForm,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            maxLength: 1,
                            validator: (value) {
                              if(value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(
                                  left: 20,
                                  top: (localLang == 'ar') ? 8 : 15,
                                  bottom: 15,
                                  right: 20),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffA2A2A2), width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffA2A2A2), width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: bloodColor.mainColor, width: 1.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffA2A2A2), width: 1.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                 borderSide: BorderSide(
                                    color: bloodColor.mainColor, width: 1.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            maxLength: 1,
                            validator: (value) {
                              if(value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              
                              contentPadding: EdgeInsets.only(
                                  left: 20,
                                  top: (localLang == 'ar') ? 8 : 15,
                                  bottom: 15,
                                  right: 20),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffA2A2A2), width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffA2A2A2), width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: bloodColor.mainColor, width: 1.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffA2A2A2), width: 1.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffA2A2A2), width: 1.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: TextFormField(
                            maxLength: 1,
                            validator: (value) {
                              if(value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(
                                  left: 20,
                                  top: (localLang == 'ar') ? 8 : 15,
                                  bottom: 15,
                                  right: 20),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffA2A2A2), width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffA2A2A2), width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: bloodColor.mainColor, width: 1.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffA2A2A2), width: 1.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffA2A2A2), width: 1.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            maxLength: 1,
                            validator: (value) {
                              if(value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(
                                  left: 20,
                                  top: (localLang == 'ar') ? 8 : 15,
                                  bottom: 15,
                                  right: 20),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffA2A2A2), width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffA2A2A2), width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: bloodColor.mainColor, width: 1.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffA2A2A2), width: 1.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffA2A2A2), width: 1.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Re-send',
                            style: TextStyle(color: bloodColor.mainColor),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context).pop(_controllerDialog.text.toString());
                          if(_verifyForm.currentState.validate()) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 40, right: 40, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: bloodColor.mainColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'OK',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // get shared colors
  BloodColors bloodColor = new BloodColors();
  // initialize mobile number of user
  int mobileNumber = 0;
  // create form key
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) => ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // add arrow back icon
                Container(
                  padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Container(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: bloodColor.mainColor, size: 30),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                // add verify number title
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
                  child: Text(
                    AppLocalizations.of(context).translate('verifyTitle'),
                    style: SharedStyles().mainTitleStyle,
                  ),
                ),
                // create form
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: bloodColor.bGrey,
                        ),
                        child: Text(
                          '+2',
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          child: Form(
                            key: _formKey,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: bloodColor.bGrey,
                                        contentPadding: EdgeInsets.only(
                                            left: 20,
                                            top: (localLang == 'ar') ? 8 : 15,
                                            bottom: 15,
                                            right: 20),
                                        hintText: AppLocalizations.of(context)
                                            .translate('inputPlaceholder'),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: bloodColor.bGrey,
                                              width: 5.0),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: bloodColor.bGrey,
                                              width: 5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: bloodColor.bGrey,
                                              width: 5.0),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: bloodColor.bGrey,
                                              width: 5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: bloodColor.bGrey,
                                              width: 5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: bloodColor.bGrey,
                                              width: 5.0),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return AppLocalizations.of(context)
                                              .translate('emptyPhoneField');
                                        }
                                        if (value.length > 1 ||
                                            value.length < 1) {
                                          return AppLocalizations.of(context)
                                              .translate(
                                                  'maxOrMinNumbersInPhone');
                                        }
                                        return null;
                                      },
                                      onSaved: (mobileNumberValue) {
                                        mobileNumber =
                                            int.parse(mobileNumberValue);
                                      },
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // submit button
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      popUpConfirmation(context);
                    }
                  },
                  child: Container(
                    height: 45,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: bloodColor.mainColor),
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppLocalizations.of(context).translate('getNumber'),
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
          ],
        ),
      ),
    );
  }
}
