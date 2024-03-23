import 'package:news_app/models/sources/sources.dart';

class SourcesResponse {
  String? code;
  String? message;
  String? status;
  List<Sources>? sources;

  SourcesResponse({
    this.code,
    this.message,
    this.status,
    this.sources,
  });

  SourcesResponse.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources!.add(Sources.fromJson(v));
      });
    }
  }
}
