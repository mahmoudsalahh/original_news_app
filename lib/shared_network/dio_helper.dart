import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
 static late Dio dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl:'https://newsapi.org/',
        receiveDataWhenStatusError: true,

      ),
    );
  }
 static Future<Response> getData({
  required String url ,
    Map<String,dynamic>? query,

 })async{

    return await dio.get(url , queryParameters: query);
  }
  static Future<Response> postData({
    required String url ,
     Map<String,dynamic>? query,
    String? token,
    required Map<String,dynamic> data,
}) async
{
  return dio.post(url ,queryParameters: query ,data : data );
}
}