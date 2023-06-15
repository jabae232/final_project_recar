part of 'post_profile_bloc.dart';

@immutable
abstract class PostProfileState {}

class PostProfileInitial extends PostProfileState {}
class PostProfileLoadingState extends PostProfileState {}
class PostProfileLoadedState extends PostProfileState {
  final List<Like> postList;
  PostProfileLoadedState({
    required this.postList
});
}
class PostProfileError extends PostProfileState {}
