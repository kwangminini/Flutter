import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatefulWidget {

  final FirebaseUser user;
  AccountPage(this.user);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(); //구글 로그아웃을 위한 설정

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              FirebaseAuth.instance.signOut();
              _googleSignIn.signOut();
            })
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row( //가로 행으로 일렬이므로 Row사용
        crossAxisAlignment: CrossAxisAlignment.start, //처음에 화면 전체가 Row로 잡혀있어 가운데로 위치하는것을 가장 위로 붙이기 위해 사용
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //할당된 공간에서 서로 사이 사이 같은 간격을 띄우고 정렬시킨다.
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack( //사진 위에 + 모양 버튼을 올리기 위해 Stack사용
                children: <Widget>[
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.user.photoUrl),
                    ),
                  ),
                  Container( // + 모양의 FloatingActionButton을 우측 아래로 보내기 위해 Container로 묶고 alignment 설정한다
                    width: 80.0,
                    height: 80.0,
                    alignment: Alignment.bottomRight,
                    child: Stack( //FloatingActionButton의 테두리를 하얀색으로 표기하기 위해 조금더 사이즈 큰 흰색 원과 그 위에 기존의 + 모양의 버튼을 덧대기 위해 Stack 사용
                      alignment: Alignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 28.0,
                          height: 28.0,
                          child: FloatingActionButton(onPressed: null,
                            backgroundColor: Colors.white,
                            ),
                        ),
                        SizedBox(
                          width: 25.0,
                          height: 25.0,
                          child: FloatingActionButton(onPressed: null,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.add),),
                        ),
                      ],
                    )
                  )
                ],

              ),
              Padding(padding: EdgeInsets.all(8.0),),
              Text(widget.user.displayName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),)

            ],
          ),
          Text('0\n게시물',textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0),),
          Text('0\n팔로워',textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0)),
          Text('0\n팔로잉',textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0)),
        ],
      ),
    );
  }
}
