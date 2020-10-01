import 'dart:convert';

import 'package:http/http.dart' as http;

import '../podo/category.dart';

class Api {
  static String baseURL = "http://admin.mynewsmalaysiaapp.com/";
  static String popular = baseURL + "api.php?get=top";
  static String breaking = baseURL + "api.php?get=breaking";
  static String trends = baseURL + "api.php?get=trends";
  static String searchUrl = baseURL + "api.php?get=search&char=";
  static String imageURL = baseURL + "images/";
  static String videoURL = baseURL +"api.php?get=videos";


  //static String

  static Future<CategoryFeed> getNews(String url) async {
    var res = await http.get(url);
    CategoryFeed category;
    if (res.statusCode == 200) {
      final jsonResponse = json.decode(res.body);
      category = CategoryFeed.fromJson(jsonResponse);
    } else {
      throw ("Error ${res.statusCode}");
    }
    return category;
  }

  static Future<bool> updateCount(String url) async {
    var res = await http.get(url);
    if (res.statusCode == 200) {
    } else {
      throw ("Error ${res.statusCode}");
    }
    return true;
  }
  Future GetVideo()async{
    var url = baseURL + "api.php?get=videos";
    var res = await http.get(url);
    if(res.statusCode == 200){
      return res.body;
    }else{
      throw "error";
    }
  }
}
