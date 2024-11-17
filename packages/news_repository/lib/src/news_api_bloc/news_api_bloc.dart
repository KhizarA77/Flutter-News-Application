import 'package:bloc/bloc.dart';
import 'package:news_repository/news_repository.dart';

class NewsApiBloc extends Bloc<NewsApiEvent, NewsApiState> {

  NewsApiBloc({required this.newsApiRepository}) : super(NewsApiInitial()) {
    on<FetchNews>(_fetchNews);
  }
  NewsRepository newsApiRepository;

  Future<void> _fetchNews(FetchNews event, Emitter<NewsApiState> emit) async {
    emit(NewsApiLoading());
    try {
      final news = await newsApiRepository.fetchNews();
      emit(NewsApiLoaded(news));
    } catch (e) {
      emit(NewsApiError(e.toString()));
    }
  }


}