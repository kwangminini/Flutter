import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final FirebaseUser user;
  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text(
          'Instagram Clone',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      )),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Instagram에 오신 것을 환영합니다.',
                style: TextStyle(fontSize: 24.0),),
                Padding(padding: EdgeInsets.all(8.0)),
                Text('사진과 동영상을 보려면 팔로우하세요'),
                Padding(padding: EdgeInsets.all(16.0)),
                SizedBox( //box의 사이즈 조정
                  width: 260,
                  child: Card(
                    elevation: 4, //그림자 굵기 4가 default
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: CircleAvatar(
                                backgroundImage: NetworkImage(user.photoUrl),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(8),),
                          Text(user.email,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(user.displayName),
                          Padding(padding: EdgeInsets.all(8),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center, //가운데 정렬
                            children: <Widget>[
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network('https://cdn.pixabay.com/photo/2017/09/21/19/12/france-2773030_1280.jpg',fit: BoxFit.cover)
                                  //fit: BoxFit.cover : 이미지의 비율을 무시하고 정사각형으로 만들어준다
                              ),
                              Padding(padding: EdgeInsets.all(1),),
                              SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Image.network('https://cdn.pixabay.com/photo/2017/09/21/19/12/france-2773030_1280.jpg',fit: BoxFit.cover)
                              ),
                              Padding(padding: EdgeInsets.all(1),),
                              SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Image.network('https://cdn.pixabay.com/photo/2017/09/21/19/12/france-2773030_1280.jpg',fit: BoxFit.cover)
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(4),),
                          Text('Facebook 친구'),
                          Padding(padding: EdgeInsets.all(4),),
                          RaisedButton(
                            child: Text('팔로우'),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            onPressed: (){},
                          ),
                          Padding(padding: EdgeInsets.all(4),)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          'Instagram Clone',
//          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
//        ),
//      ),
//    );
//  }
//}
