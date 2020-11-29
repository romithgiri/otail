import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:async/async.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpWebCall {

  Future<String> post(String apiName, String request) async{
    final response = await http.post(apiName, headers: {HttpHeaders.contentTypeHeader : "application/json"}, body: request);
    print(response.statusCode.toString());
    if(response.statusCode < 200 || response.statusCode > 400){
      print(response.statusCode.toString());
      return null;
    }
    else{
      return response.body;
    }
  }

  Future<String> get(String apiName) async{
    final response = await http.get(apiName, headers: {HttpHeaders.contentTypeHeader : "application/json"});
    if(response.statusCode < 200 || response.statusCode > 400){
      return null;
    }
    else if(response.statusCode == 200){
      return response.body;
    }else{
      return null;
    }
  }

}