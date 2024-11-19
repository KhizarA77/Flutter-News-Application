import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:newsapp/NewsScreen.dart';
import 'package:newsapp/shimmer_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 228, 238),
        appBar: AppBar(
          title: const Row(
            children: [
              Column(
                children: [
                  Text('Headline News', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 2),
                  Text('Read Top News Today', style: TextStyle(color: Colors.black, fontSize: 12)),
                ],
              ),
              SizedBox(width: 200),
              Image(image: AssetImage('assets/newspaper.png'), height: 50, width: 50),
            ],
          ),
        ),
      body: BlocProvider(
        create: (context) => NewsApiBloc(newsApiRepository: NewsRepository())..add(const FetchNews()),
        child: NewsScreen(),
      ),  
      ),
    );
  }
}