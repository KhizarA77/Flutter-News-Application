class NewsItem {


  const NewsItem({

    required this.title,
    required this.author,
    required this.publishedAt,
    required this.urlToImage,
    required this.description,
    required this.content,

  });

  final String? title;
  final String? author;
  final String? publishedAt;
  final String? urlToImage;
  final String? description;
  final String? content;

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      title: json['title'] as String?,
      author: json['author'] as String?,
      publishedAt: (json['publishedAt'] as String?)?.substring(0, 10),
      urlToImage: json['urlToImage'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?
    );

  }
}