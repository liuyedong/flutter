
import 'package:flutter/material.dart';
import 'package:myappdemo/ListView/RandomWords.dart';
import 'package:myappdemo/Scaffold/ScaffoldDemo.dart';
import 'package:myappdemo/TabBar/TabBarDemo.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List demoList;

  @override
  void initState() {
    super.initState();

    demoList = [
      {'name':'ListView','page':RandomWords()},
      { 'name': 'Scaffold组件', 'page': ScaffoldDemoPage() },
      { 'name':'TabBar/TabView',  'page':TabBarDemoPage(), },
    ];
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:20, left: 20, right: 20),
        child: ListView.separated(
          itemCount: demoList.length,
          itemBuilder: (context,index){
            Map<String, dynamic> data = demoList[index];
            return RaisedButton(
              child: Center(
                child: Text( data['name'] ),
              ),
              onPressed: (){
                _gotoPage( data['page']);
              },
            );
          },
          separatorBuilder: (context,index){
            return SizedBox( height: 20,);
          },

        ),
      )
    );
  }

  ///页面跳转
  void _gotoPage(Widget page){
    Navigator.push(context, new MaterialPageRoute(builder: (context){
      return page;
    }));
  }

}
