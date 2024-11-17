import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:newsapp/custom_tiles.dart';
import 'package:newsapp/shimmer_tile.dart';


class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsApiBloc, NewsApiState>(
      builder: (context, state) {
        if (state is NewsApiLoading) {
          return const SkeletonList();
        } else if (state is NewsApiLoaded) {
          return ListView.builder(
            itemCount: state.news.newsItems.length,
            itemBuilder: (context, index) {
              return CustomTile(newsItem: state.news.newsItems[index]);
            },
          );
        } else if (state is NewsApiError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Container();
        }
      },
    );
  }
}