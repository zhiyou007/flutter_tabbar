import 'package:flutter/material.dart';


class MinePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("我的"),),
      body: new Mine(),
    );
  }
}

class Mine extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new MineState();
  }
}

class MineState extends State<Mine>{
  var _throwShotAway = false;
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new ListTile(
        title: new Text("duo_shine"),
        subtitle: new Text("duo_shine@163.com"),
        leading: new Icon(Icons.email,color: Colors.blueAccent),
        trailing: new Checkbox(value: _throwShotAway,
            onChanged: (bool newValue){
              setState(() {
                _throwShotAway = newValue;
              });
            }),
      ),
    );
  }
}
