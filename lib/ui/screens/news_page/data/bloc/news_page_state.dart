part of 'news_page_bloc.dart';

@immutable
abstract class NewsPageState {}

class NewsPageInitial extends NewsPageState {}
class NewsPageLoading extends NewsPageState {}
class NewsPageLoaded extends NewsPageState {
  final List<AllPostsDto> posts;
  NewsPageLoaded({
    required this.posts
});
}
class NewsPageError extends NewsPageState {}
