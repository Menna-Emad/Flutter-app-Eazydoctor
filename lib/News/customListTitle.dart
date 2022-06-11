import 'package:eazyydoctor/News/ArticlesDetailes.dart';
import 'package:eazyydoctor/News/NewsResponse.dart';
import 'package:eazyydoctor/themeData.dart';
import 'package:flutter/material.dart';

Widget customListTitle(Articles articles, BuildContext context, ){
  return InkWell(
    onTap: (){
      Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> ArticlePage(articles: articles)));
    },
    child: Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 3.0
          )
        ]
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(height: 200.0,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(articles.urlToImage?? "can't load image"),
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(8.0)
          ),
        ),
        SizedBox(height: 10.0,),
        Container( decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Text(articles.source!.name?? "",
          style: TextStyle(color: MyThemeData.primaryColor,
          fontWeight: FontWeight.bold),),
        ),
          SizedBox(height: 8.0,),
          Text(articles.title?? "",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.5
          ),)
      ],),
    ),
  );
}