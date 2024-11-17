import 'package:news_api/src/models/news_item.dart';

class NewsResults {

  const NewsResults({
    required this.newsItems,

  });

  final List<NewsItem> newsItems;

  factory NewsResults.fromJson(Map<String, dynamic> json) {
    final List<NewsItem> newsItems = (json['articles'] as List)
        .map((article) {
          return NewsItem.fromJson(article as Map<String, dynamic>);
        }).toList();

    return NewsResults(
      newsItems: newsItems,
    );
  }


}