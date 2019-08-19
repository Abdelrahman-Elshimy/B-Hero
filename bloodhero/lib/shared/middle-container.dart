import 'package:bloodhero/shared/shared_styles.dart';
import 'package:bloodhero/util/blood-colors.dart';
import 'package:flutter/material.dart';

import '../app_localizations.dart';

class MiddleContainer extends StatelessWidget {
  final String textPost;
  final BloodColors _bloodColors = new BloodColors();
  MiddleContainer(this.textPost);
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    textPost.toUpperCase(),
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
          );
  }
}