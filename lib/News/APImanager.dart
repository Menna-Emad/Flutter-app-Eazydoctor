import 'dart:convert';

import 'package:eazyydoctor/News/NewsResponse.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiManager{

  var uri= Uri.parse('http://newsapi.org/v2/top-headlines?country=eg&category=health&apiKey=898c95d1850b4bb9b36afb6f16ab94e4');
  Future<List<Articles>> getArticle() async {
    Response res = await get(uri);

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Articles> articles =
      body.map((dynamic item) => Articles.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}