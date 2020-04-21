import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramclon/create_page.dart';
import 'package:instagramclon/detail_post_page.dart';

class SearchPage extends StatefulWidget {
  final FirebaseUser user;
  SearchPage(this.user);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>CreatePage(widget.user)
        ));
      },
      child: Icon(Icons.create),
      backgroundColor: Colors.blue,),
    );
  }

  Widget _buildBody() {
      return StreamBuilder(
        stream: Firestore.instance.collection('post').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          var items = snapshot.data ?.documents ?? [];
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //crossAxisCount : 열의 개수
                  childAspectRatio: 1.0,// childAspectRatio : 자식들의 비율 1:1로 지정
                  mainAxisSpacing: 1.0, // 자식들에게 미세한 스페이싱
                  crossAxisSpacing: 1.0 //자식들에게 미세한 스페이싱
              ),
              itemCount: items.length,
              itemBuilder:(context,index){  //index 자식들의 인덱
                return _buildListItem(context,index);
              });
        },
      );
  }

  Widget _buildListItem(context, document) {
      return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return DetailPostPage(document);
          }));
        },
        child: Image.network(
          document['photoUrl'],
          fit: BoxFit.cover
        ),
      );
  }
}
