import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CuppertinoPage extends StatefulWidget {
  @override
  _CuppertinoPageState createState() => _CuppertinoPageState();
}

class _CuppertinoPageState extends State<CuppertinoPage> {
  bool _switch=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('쿠퍼티노 UI'),
      ),
      body: Column(
        children: <Widget>[
          CupertinoButton(
            child: Text('쿠퍼티노 버튼'),
          ),
          CupertinoSwitch(
            value: _switch,
            onChanged: (bool value){
              print(value);
              setState(() {
                _switch=value;
              });
            },
          ),
          RaisedButton(
            child: Text('머티리얼 버튼'),
          ),
          Switch(
            value: _switch,
            onChanged: (bool value){
              setState(() {
                _switch=value;
              });
            },
          )
        ],
      ),
    );
  }
}
