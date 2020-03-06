import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cupertino_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HelloPage("헬로 월드")
//        home: CuppertinoPage()
    );
  }
}
class HelloPage extends StatefulWidget {
   final String title;

   HelloPage(this.title);

   @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  String _message = 'Hello World';
  int _counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _changeMessage,
      ),
        appBar: AppBar(
          title: Text(widget.title)
        ),

        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_message,style: TextStyle(fontSize: 30)),
            Text('$_counter',style: TextStyle(fontSize: 30)),
            RaisedButton(
              child: Text('화면 이동'),
              onPressed: (){
//                  Navigator.push(
//                    context,
//                    CupertinoPageRoute(builder: (context)=>CuppertinoPage())
//                  );    //Cupertino 방식은 페이지가 오른쪽에서 왼쪽으로 올라온다
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>CuppertinoPage())
                  );        //Material  방식은 페이지가 아래에서 위로 올라온다
              },
            )
          ],
        )));
  }
  void _changeMessage(){
    setState(() {
      _message='헬로 월드';
      _counter+=1;
    });
  }
}

