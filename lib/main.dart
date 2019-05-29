import 'package:flutter/material.dart';
import 'package:flutter_trip/plugin_use.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'flutter_layout_page.dart';
import 'gesture_page.dart';
import 'less_group_page.dart';
import 'statefull_group.dart';
import 'launch_page.dart';

void main() => runApp(MyApp());

class MyApp  extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Scaffold(
        appBar: AppBar(title: Text('路由'),),
        body: RouteNavigator(),
      ),
      routes: <String,WidgetBuilder>{
        //指向页面的实例
        'less':(BuildContext contex) => LessGroupPage(),
        'ful':(BuildContext contex) => StateFullGroup(),
        'plugin':(BuildContext contex) => PluginUse(),
        'gesture':(BuildContext contex) => GesturePage(),
        'launch':(BuildContext contex) => LaunchPage(),

      }
    );
  }
}

class RouteNavigator extends StatefulWidget{
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator>{
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:<Widget>[
          SwitchListTile(
            title: Text('${byName?'':'不'}通过路有名跳转'),
              value: byName, 
              onChanged: (value){
            setState(() {
              byName = value;
            });
          }),
          _item('StateLessWidget与基础组件',LessGroupPage(),'less'),
          _item('StateFullWidget与基础组件',StateFullGroup(),'ful'),
          _item('插件的使用',PluginUse(),'plugin'),
          _item('手势的使用',GesturePage(),'gesture'),
          _item('打开第三方应用',LaunchPage(),'launch'),
        ]

      ),
    );
  }

  _item(String title,page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          if(byName){
            Navigator.pushNamed(context, routeName);
          }else{
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          }
      },
        child: Text(title),
      ),
    );
  }

}
