import 'package:bloodhero/app_localizations.dart';
import 'package:bloodhero/shared/blood-group.dart';
import 'package:bloodhero/util/blood-colors.dart';
import 'package:flutter/material.dart';
import 'package:bloodhero/shared/shared_styles.dart';

class AddRequest extends StatefulWidget {
  @override
  _AddRequestState createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  BloodColors _bloodColors = BloodColors();
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
          AppLocalizations.of(context).translate('addRequestTitle'),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 30, top: 20, bottom: 20, right: 30),
            child: Text(
              'Blood For',
              style: SharedStyles().smallMainTitleStyle,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 0, bottom: 15, right: 20),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                fillColor: _bloodColors.bGrey,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: _bloodColors.bGrey, width: 5.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: _bloodColors.bGrey, width: 5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: _bloodColors.bGrey, width: 5.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: _bloodColors.bGrey, width: 5.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: _bloodColors.bGrey, width: 5.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: _bloodColors.bGrey, width: 5.0),
                ),
              ),
              hint: Text('Friend'),
              items: [
                DropdownMenuItem(
                  child: Text('Friend'),
                  value: 'Friend',
                ),
                DropdownMenuItem(
                  child: Text('Family'),
                  value: 'Family',
                ),
                DropdownMenuItem(
                  child: Text('Accident'),
                  value: 'Accident',
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30, top: 20, bottom: 20, right: 30),
            child: Text(
              'City Preference',
              style: SharedStyles().smallMainTitleStyle,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 0, bottom: 20, right: 20),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                fillColor: _bloodColors.bGrey,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: _bloodColors.bGrey, width: 5.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: _bloodColors.bGrey, width: 5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: _bloodColors.bGrey, width: 5.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: _bloodColors.bGrey, width: 5.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: _bloodColors.bGrey, width: 5.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: _bloodColors.bGrey, width: 5.0),
                ),
              ),
              hint: Text('Cairo'),
              items: [
                DropdownMenuItem(
                  child: Text('Cairo'),
                  value: 'Cairo',
                ),
                DropdownMenuItem(
                  child: Text('Elmansora'),
                  value: 'Elmansora',
                ),
                DropdownMenuItem(
                  child: Text('Monifya'),
                  value: 'Monifya',
                ),
                DropdownMenuItem(
                  child: Text('Elminya'),
                  value: 'Elminya',
                ),
                DropdownMenuItem(
                  child: Text('Beni-suief'),
                  value: 'Beni-suief',
                ),
                DropdownMenuItem(
                  child: Text('Alexandria'),
                  value: 'Alexandria',
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30, top: 20, bottom: 20, right: 30),
            child: Text(
              'Select Blood Group',
              style: SharedStyles().smallMainTitleStyle,
            ),
          ),
          BloodGroup(),
          SizedBox(height: 20,),
          // submit button
          GestureDetector(
            onTap: () {
              
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
                  'submit'.toUpperCase(),
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
