import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:flutter_app/HttpController.dart';
import 'package:json_annotation/json_annotation.dart';

class RemenPage extends StatefulWidget{




  @override
  State createState() {
    return new Remen();
  }
}

class Remen extends State<RemenPage>{




  String dataStr = "";
  var _items = [];

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData()
  {

    print("getData---------");
    Map<String,String> map = new Map();
    map["v"] = "1.0";
    map["month"] = "7";
    map["day"] = "25";
    map["key"] = "bd6e35a2691ae5bb8425c8631e475c2a";
    
    HttpController.post("http://api.juheapi.com/japi/toh", (data){
      if(data != null){
        final body = json.decode(data.toString());
        final feeds = body["result"];
        var items = [];
        feeds.forEach((item){
          items.add(Model(item["_id"],item["title"],item["pic"],item["year"],item["month"], item["day"], item["des"], item["lunar"]));
        });

        setState(() {
          dataStr = data.toString();
          _items = items;
        });
      }
    },params: map);
  }

  Widget buildAppBar(BuildContext context){
    return new AppBar(title:const Text("历史今天"));
  }


  Widget layout(BuildContext context){
    return new Scaffold(
      appBar: buildAppBar(context),
      body: new ListView.builder(itemCount:_items.length,itemBuilder: itemView),
    );
  }

  Widget itemView(BuildContext context,int index){
    Model model = this._items[index];
    if(index.isOdd) return new Divider(height: 2.0);
    return new Container(
      color: Color.fromARGB(0x22, 0x49, 0xa9, 0x8d),
      child: new Padding(
          padding:const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Text('${model.year}年${model.month}月${model.day}日'),
                  new Text('${model.lunar}'),
                ],
              ),
              new Center(
                heightFactor: 6.0,
                child: new Text("${model.title}"),
              )
            ],
          ),
      ),
    );
  }

}

class Model {
  String _id;
  String title;
  String pic;
  int year;
  int month;
  int day;
  String des;
  String lunar;

  Model(this._id, this.title, this.pic, this.year, this.month, this.day,
      this.des, this.lunar);
}