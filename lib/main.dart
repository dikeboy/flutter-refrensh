import 'package:flutter/material.dart';
import 'package:flutter_pull/com/lin/lnpull/lnpullbase.dart';
import 'dart:io';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends LnpullListenerState<MyHomePage> {
  List<String>  list= [];


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<100;i++){
       list.add("i am $i");
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
      child:  getPullListener(
          child:ListView.separated(
            itemCount: list.length+1,
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 1,
              color: Colors.transparent,
            ),
            itemBuilder: (BuildContext context, int position) {

              return getRow(position);
            },
            controller: scrollController,
            padding:EdgeInsets.all(0),
          )
          ,startRefrensh:onRefrensh,height:40),
    ),
    );
  }

  getRow(int position){
   if(position==0){
     return getRfrenshHeader();
   }
   else{
     return  Text(list[position]);
   }
  }
  onRefrensh()  async{
    await   Future.delayed(const Duration(seconds: 3));
    setState(() {
      finishLoading();
    });
  }
  @override
  void dispose() {
    super.dispose();
  }
}
