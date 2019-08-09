import 'package:bloodhero/app_localizations.dart';
import 'package:bloodhero/shared/shared_styles.dart';
import 'package:bloodhero/util/blood-colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyNumber extends StatefulWidget {
  @override
  _VerifyNumberState createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
    String localLang;

  Future checkLocalStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      localLang = prefs.getString('local');
    });
    print(localLang);
  }

  @override
  void initState() {
    super.initState();
    
    checkLocalStatus();
  }

  BloodColors bloodColor = new BloodColors();
  int mobileNumber = 0;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 60, left: 10, right: 10),

                child: Container(
                  // child: Image.asset('assets/images/left-arrow (4).png'),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: bloodColor.mainColor, size: 30),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
              child: Text(
                AppLocalizations.of(context).translate('verifyTitle'),
                style: SharedStyles().mainTitleStyle,
              ),
            ),
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
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: bloodColor.bGrey, width: 5.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: bloodColor.bGrey, width: 5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: bloodColor.bGrey, width: 5.0),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: bloodColor.bGrey, width: 5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: bloodColor.bGrey, width: 5.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: bloodColor.bGrey, width: 5.0),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return AppLocalizations.of(context).translate('emptyPhoneField');
                                    }
                                    if (value.length > 11 ||
                                        value.length < 11) {
                                      return AppLocalizations.of(context).translate('maxOrMinNumbersInPhone');
                                    }
                                    return null;
                                  },
                                  onSaved: (mobileNumberValue) {
                                    mobileNumber = int.parse(mobileNumberValue);
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
            GestureDetector(
              onTap: () {
                if (_formKey.currentState.validate()) {
                  // Scaffold.of(context)
                  //     .showSnackBar(SnackBar(content: Text('Processing Data')));

                  _formKey.currentState.save();
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
      ),
    );
  }
}
