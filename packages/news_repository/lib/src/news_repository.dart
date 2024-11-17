import 'package:news_api/newsapi.dart';

class NewsRepository {

  NewsRepository({NewsClient? newsApiClient})
      : newsApiClient = newsApiClient ?? NewsClient();

  final NewsClient newsApiClient;

  Future<NewsResults> fetchNews() async {
    return newsApiClient.fetchNews();
  }

}