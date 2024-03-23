import 'package:flutter/material.dart';
import 'package:news_app/models/News/articles.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class NewsWidget extends StatelessWidget {
  final Articles article;
  const NewsWidget(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      decoration:  BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(Radius.circular(8.0))
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Shimmer(
                gradient: LinearGradient(
                  colors: [Colors.grey[300]!, Colors.grey[100]!, Colors.grey[300]!],
                  stops: const [0.1, 0.5, 0.9],
                ),
                child: Container(
                  width: 360,
                  height: 230,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: FadeInImage.memoryNetwork(
                  image: article.urlToImage??"",
                  width: 360,
                  height: 230,
                  fit: BoxFit.cover,
                  placeholder: kTransparentImage,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(article.title!,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey[400]),),
                Text(article.description!,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey[700]),),
                Text("${article.source!.name!} ● ${article.publishedAt!.substring(0,10)}",textAlign: TextAlign.end,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey[400]),),
                Text(article.author != null?"by ${article.author}":"",textAlign: TextAlign.end,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey[400]),),
              ],
            ),
          )

        ],
      ),
    );
  }
}