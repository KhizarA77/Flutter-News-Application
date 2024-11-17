import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import './models/models.dart';



class NewsRequestFailure implements Exception {}
class NewsNotFoundFailure implements Exception {}



class NewsClient {


  NewsClient ({
    http.Client? httpClient,
    this.baseUrl = 'https://newsapi.org/v2/top-headlines?country=us',
    this.apiKey = 'f44545adf4ce491281ab45c1082311cb',
  }) : httpClient = httpClient ?? http.Client();

  final http.Client httpClient;
  final String baseUrl;
  final String apiKey;

  Future<NewsResults> fetchNews() async {

    final response = await httpClient.get(Uri.parse('$baseUrl&apiKey=$apiKey'));

    if (response.statusCode != 200) {
      throw NewsRequestFailure();
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    if (json['status'] != 'ok' || json['totalResults'] == 0) {
      throw NewsNotFoundFailure();
    }


    return NewsResults.fromJson(json);



  }




}