import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("我的"),
      ),
      body: new Mine(),
    );
  }
}

class Mine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MineState();
  }
}

class MineState extends State<Mine> {
  var _throwShotAway = false;
  @override
  Widget build(BuildContext context) {
//    Widget topview = new Swiper(
//      itemCount: 3,
//      viewportFraction: 0.85,
//      scale: 0.9,
//      itemBuilder: _swiperBuilder,
//      pagination: new SwiperPagination(
//        builder: DotSwiperPaginationBuilder(
//          color: Colors.black54,
//          activeColor: Colors.white,
//        )
//      ),
//      controller: new SwiperController(),
//      scrollDirection: Axis.horizontal,
//      autoplay: true,
//      onTap: (index){
//        print('click $index');
//      },
//    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    }

//    return new ListView(
//      children: <Widget>[
//        new Container(
//          width: MediaQuery.of(context).size.width,
//          height: 200.0,
//          child: Swiper(
//            itemCount: 3,
//            viewportFraction: 0.85,
//            scale: 0.9,
//            itemBuilder: _swiperBuilder,
//            pagination: new SwiperPagination(
//                builder: DotSwiperPaginationBuilder(
//              color: Colors.black54,
//              activeColor: Colors.white,
//            )),
//            controller: new SwiperController(),
//            scrollDirection: Axis.horizontal,
//            autoplay: true,
//            onTap: (index) {
//              print('click $index');
//            },
//          ),
//        ),
//        new Container(
//          margin: const EdgeInsets.only(top: 30.0),
//          width: MediaQuery.of(context).size.width,
//          child: new Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
////              new Expanded(child: new Text('111',textAlign: TextAlign.center),),
////              new Expanded(child: new Text('222',textAlign: TextAlign.center),),
////              new Expanded(child: new FittedBox(fit: BoxFit.contain,child: const FlutterLogo(),),),
//              buildButtonColumn(Icons.call, 'CALL'),
//              buildButtonColumn(Icons.near_me, "ROUTE"),
//              buildButtonColumn(Icons.share, "SHARE"),
//            ],
//          ),
//        )
//      ],
//    );

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: Swiper(
        itemCount: 3,
        viewportFraction: 0.85,
        scale: 0.9,
        itemBuilder: _swiperBuilder,
        pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
          color: Colors.black54,
          activeColor: Colors.white,
        )),
        controller: new SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) {
          print('click $index');
        },
      ),
    );

//    return Column(
//      mainAxisAlignment: MainAxisAlignment.start,
//      children: <Widget>[
//        topview,
//      ],
//    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      "http://d.hiphotos.baidu.com/image/pic/item/9825bc315c6034a84d0cf125c6134954082376a3.jpg",
      fit: BoxFit.fill,
    ));
  }
}
