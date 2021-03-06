import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CreatePage extends StatefulWidget {
  final FirebaseUser user;
  CreatePage(this.user);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

  File _image;
  @override
  void dispose() { //class가 종료될때 호출
    // TODO: implement dispose
    textEditingController.dispose();  //메모리 해제
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {  //class가 생성될때 호출
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(icon: Icon(Icons.send), onPressed: (){
          final firebaseStorageRef = FirebaseStorage.instance.ref().child('post').child('${DateTime.now().millisecondsSinceEpoch}.png');
          final task = firebaseStorageRef.putFile( //이미지 업로드
            _image, StorageMetadata(contentType: 'image/png')
          );
          task.onComplete.then((value){
            var downloadUrl = value.ref.getDownloadURL();

            downloadUrl.then((uri){
              var doc = Firestore.instance.collection('post').document();
              doc.setData({
                'id' : doc.documentID,
                'photoUrl' : uri.toString(),
                'contents' : textEditingController.text,
                'email' : widget.user.email,
                'displayName' : widget.user.displayName,
                'userPhotoUrl' : widget.user.photoUrl
              }).then((onValue){
                Navigator.pop(context);
              });
            });
          });
        })
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView( //자판이 올라오면서 사진의 영역을 침범하는것을 막기위해 사진쪽에 스크롤 뷰를 만들어준다. SingleChildScrollView
        child: Column(
      children: <Widget>[
        _image == null ? Text('No Image') : Image.file(_image),
        TextField(controller: textEditingController,
          decoration: InputDecoration(hintText: '내용을 입력하세요'),
        )
      ],
    ));
  }

  Future<void> _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery); //비동기로 나중에 콜백 , await 을 통해 비동기식으로 만들어 준다!!
//    Future<File> image = ImagePicker.pickImage(source: ImageSource.gallery); //비동기로 나중에 콜백
//    File image = await ImagePicker.pickImage(source: ImageSource.gallery); //비동기로 나중에 콜백
    setState(() {
      _image=image;
    });
  }
}
