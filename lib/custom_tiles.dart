import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_repository/news_repository.dart';
import 'package:news_api/newsapi.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({Key? key, required this.newsItem}) : super(key: key);
  final NewsItem newsItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      color: Color.fromARGB(255, 241, 241, 241),
      child: InkWell(
        child: ListTile(
          contentPadding: const EdgeInsets.all(20),
          title: Text(newsItem.title ?? "No title", maxLines: 2, overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15)),
          subtitle: Column(
            children: [
              Text(newsItem.author ?? "No author", maxLines: 1, overflow: TextOverflow.ellipsis,),
              Text(newsItem.publishedAt ?? "No date"),
            ],
          ),
          leading: Image.network(
              newsItem.urlToImage ?? "https://via.placeholder.com/150"),
        ),
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 1920,
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(newsItem.title ?? "No title",
                          style: TextStyle(fontSize: 20)),
                      Text('By ${newsItem.author}'),
                      Text('Published on ${newsItem.publishedAt}'),
                      Image.network(newsItem.urlToImage ??
                          "https://via.placeholder.com/150"),
                      Text(newsItem.description ?? "No description",
                          style: TextStyle(fontSize: 16)),
                      Text(newsItem.content ?? "No content"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
