import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

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
        onPressed: null,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(icon: Icon(Icons.send), onPressed: null)
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Text('No Image'),
        TextField(controller: textEditingController,
          decoration: InputDecoration(hintText: '내용을 입력하세요'),
        )
      ],
    );
  }
}
