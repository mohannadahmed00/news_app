import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/News/news_response.dart';
import 'package:news_app/models/sources/sources_response.dart';
class ApiManager{
  static Future<SourcesResponse> getResources(String category)async{
    String mCategory;
    if(category=="politics"){
      mCategory = "general";
    }else if(category=="environment"){
      mCategory = "technology";
    }else{
      mCategory = category;
    }
    Uri url = Uri.https("newsapi.org","/v2/top-headlines/sources",
        {
          "apiKey":"66f615ade19145f4898c185407468a03",
          "category":mCategory
        }
    );
    http.Response sourceResponse = await http.get(url);
    var jsonResponse = jsonDecode(sourceResponse.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonResponse);
    return sourcesResponse;
  }

  static Future<NewsResponse> getNews(String searchText,String resourceId)async{
    Uri url = Uri.https("newsapi.org","/v2/everything",
        {
          "apiKey":"66f615ade19145f4898c185407468a03",
          "q":searchText,
          "searchIn":"title",
          "sources":resourceId,
        }
    );
    http.Response newsResponse = await http.get(url);
    var jsonResponse = jsonDecode(newsResponse.body);
    NewsResponse news = NewsResponse.fromJson(jsonResponse);
    return news;
  }
}

//key1: 66f615ade19145f4898c185407468a03
//key2: 68c0c221e3fd46b992da746c36608692