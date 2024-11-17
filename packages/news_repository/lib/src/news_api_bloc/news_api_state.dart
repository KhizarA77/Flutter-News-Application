import 'package:equatable/equatable.dart';
import 'package:news_api/newsapi.dart';

sealed class NewsApiState extends Equatable {
  const NewsApiState();

  @override
  List<Object> get props => [];
}

final class NewsApiInitial extends NewsApiState {}
final class NewsApiLoading extends NewsApiState {}


final class NewsApiLoaded extends NewsApiState {
  
  final NewsResults news;
  const NewsApiLoaded(this.news);

  @override
  List<Object> get props => [news];
}

final class NewsApiError extends NewsApiState {
  final String message;
  const NewsApiError(this.message);

  @override
  List<Object> get props => [message];
}