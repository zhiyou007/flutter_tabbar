import 'package:flutter/material.dart';
class FindPage extends StatelessWidget{

  final List<String> items;

  FindPage({Key key,@required this.items}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("发现"),),
      body: new Find()
    );
  }
}

class Find extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() {
    return FindState();
  }
}

class FindState extends State<Find>
{
  List<String> items;
  @override
  Widget build(BuildContext context) {
      items = new List<String>.generate(1000, (i) => "Item $i");
      return new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          return new ListTile(title: new Text("${items[index]}"),);
        });
  }
}