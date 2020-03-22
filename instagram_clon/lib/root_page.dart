import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; //Android Design Material
import 'package:instagramclon/login_page.dart';
import 'package:instagramclon/tab_page.dart';

class RootPage extends StatelessWidget {
  //페이지가 변하지 않는 페이지 이므로 StatelessWidget
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return TabPage(snapshot.data);
        } else {
          return LoginPage();
        }
      },
    );
  }
}