import 'articles.dart';

class NewsResponse {
  NewsResponse({
    this.code,
    this.message,
    this.status,
    this.totalResults,
    this.articles,
  });

  NewsResponse.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }

  String? code;
  String? message;
  String? status;
  int? totalResults;
  List<Articles>? articles;
}
