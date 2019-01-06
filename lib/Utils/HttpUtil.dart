import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Api{
  static const String BaseUrl = "";
}

class HttpUtil{
  static const String GET = "get";
  static const String POST = "post";
  static void get(String url,Function callback,
      {Map<String,String> params,
      Map<String,String> headers,
      Function errrorCallback}) async{
    if(!url.startsWith("http"))
    {
      url = Api.BaseUrl+url;
    }

    if(params!=null && params.isNotEmpty)
    {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key,value){
        sb.write("$key"+"="+"$value"+"&");
      });

      String paramStr = sb.toString();
      paramStr = paramStr.substring(0,paramStr.length -1);
      url += paramStr;
    }

    await _request(url,callback,method:GET,headers:headers,params:params,errorCallback:errrorCallback);

  }

  static void post(String url,Function callback,{Map<String,String> params,Map<String,String> headers,Function errorCallback}) async{
    if(!url.startsWith("http"))
    {
      url = Api.BaseUrl+url;
    }

    await _request(url,callback,method:POST,headers:headers,params:params,errorCallback:errorCallback);
  }

  static Future _request(String url,Function callback,{String method,Map<String,String> headers,Map<String,String> params,Function errorCallback}) async {
    String errorMsg;
    int errorCode;
    var data;
    try{
      Map<String,String> headerMap = headers == null?new Map():headers;
      Map<String,String> paramMap = params == null?new Map():params;

      http.Response res;
      if(POST == method){
        res = await http.post(url,headers: headerMap,body: paramMap);
      }else{
        res = await http.get(url,headers: headerMap);
      }

      if(res.statusCode != 200){
        errorMsg = "网络请求错误,状态码:"+res.statusCode.toString();
        _handError(errorCallback,errorMsg);
        return;
      }

      Map<String,dynamic> map = json.decode(res.body);
      errorCode = map["errorCode"];
      errorMsg = map["errorMsg"];
      data = map["data"];

      if(callback != null){
        if(errorCode >= 0)
        {
          callback(data);
        }else{
          _handError(errorCallback, errorMsg);
        }
      }
    }catch(exception){

    }
  }

  static void _handError(Function errorCallback,String errorMsg){
    if(errorCallback != null){
      errorCallback(errorMsg);
    }
  }





}

//HttpUtil.get("banner/json", (data) {
//List banners = data;
//print(banners.toString());
//});

//Map<String, String> headers = new Map();
//headers['Cookie'] = "我是cookie";
//HttpUtil.get("banner/json", (data) {
//List banners = data;
//print(banners.toString());
//}, errorCallback: (msg) {
//print(msg);
//}, headers: headers);

//_login() {
//
//  Map<String,String> map = new Map();
//  map['username'] = 'canhuah';
//  map['password'] = 'a123456';
//
//  HttpUtil.post('user/login', (data) {
//
////      _showMessage('登录 成功');
//  },
//      params: map,
//      errorCallback: (msg) {
////     _showMessage(msg);
//      });
//}