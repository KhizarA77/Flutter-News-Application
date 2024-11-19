import 'package:flutter/material.dart';
import 'package:news_api/newsapi.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({Key? key, required this.newsItem}) : super(key: key);
  final NewsItem newsItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: const Color.fromARGB(255, 231, 225, 225),
      child: InkWell(
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 1, vertical: 8),
          title: Text(newsItem.title ?? "No title",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                newsItem.author ?? "No author",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
              Text(
                newsItem.publishedAt ?? "No date",
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          leading: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              newsItem.urlToImage ?? "https://via.placeholder.com/150",
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Text(
                        newsItem.title ?? "No title",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'By ${newsItem.author ?? "Unknown author"}',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        'Published on ${newsItem.publishedAt ?? "Unknown date"}',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(
                          newsItem.urlToImage ??
                              "https://via.placeholder.com/150",
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        newsItem.description ?? "No description available.",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        newsItem.content ?? "No content available.",
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                          onPressed: () async {
                            final Uri url = Uri.parse(
                                newsItem.url ?? "https://newsapi.org/");
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url,
                                  mode: LaunchMode.inAppBrowserView);
                            } else {
                              // Handle the error gracefully
                              print("Could not launch $url");
                            }
                          },
                          // onPressed: () {},
                          child: const Text('Read More',
                              style: TextStyle(color: Colors.blue))),
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
