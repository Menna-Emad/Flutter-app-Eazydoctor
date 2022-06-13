import 'package:eazyydoctor/News/APImanager.dart';
import 'package:eazyydoctor/News/customListTitle.dart';
import 'package:eazyydoctor/News/NewsResponse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NewsTap extends StatelessWidget {
  static const String routename='news';
  ApiManager client = ApiManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/x1.0/news.png'),fit: BoxFit.cover)),
        child: FutureBuilder (
          future: client.getArticle(),
          builder: (BuildContext context, AsyncSnapshot<List<Articles>> snapshot){
            if (snapshot.hasError){
              print('errrrror ${snapshot.error.toString()}');
              return Center(child: Text(snapshot.error.toString()));
            }else if (snapshot.hasData){
              List<Articles>? articles = snapshot.data;
              return ListView.builder(itemCount: articles?.length,
                  itemBuilder: (context,index) =>
                      customListTitle(articles![index], context)
                  );
            }
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
      ),
    );
  }
}