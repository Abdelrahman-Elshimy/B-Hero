import 'package:bloodhero/screens/home.dart';
import 'package:bloodhero/screens/onBoarding.dart';
import 'package:flutter/material.dart';
import 'package:bloodhero/util/utilies.dart';


void main() async{

  bool _seen = await checkSeenStatus();
  Widget _home = OnBoardingPage();
  if(_seen) {
    _home = MyHomePage();
  }
  updateStatus();
  runApp(MyApp(_home));
  
} 


class MyApp extends StatefulWidget {
  final Widget _home;
  MyApp(this._home);
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'B-Hero',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: widget._home,
    );
  }
}


