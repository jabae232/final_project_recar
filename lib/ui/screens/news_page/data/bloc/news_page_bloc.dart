import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../dto/all_posts_dto.dart';
import '../repo/news_page_repo.dart';

part 'news_page_event.dart';
part 'news_page_state.dart';

class NewsPageBloc extends Bloc<NewsPageEvent, NewsPageState> {
  final RepoNewsScreen repo;
  NewsPageBloc({
    required this.repo
}) : super(NewsPageInitial()) {
    on<GetNewsEvent>(_onGetNews);
  }
  _onGetNews(GetNewsEvent getNewsEvent, Emitter<NewsPageState> emitter) async {
    emit(NewsPageLoading());
    final List<AllPostsDto> list = await repo.fetch();
    emit(NewsPageLoaded(posts: list));
  }
}
