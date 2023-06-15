part of 'own_post_bloc.dart';

@immutable
abstract class OwnPostState {}

class OwnPostInitial extends OwnPostState {}
class OwnPostLoadingState extends OwnPostState {}
class OwnPostLoadedState extends OwnPostState {
  final List<Like> postList;
  OwnPostLoadedState({
    required this.postList
});
}
class OwnPostErrorState extends OwnPostState {
  final String errorMessage;
  OwnPostErrorState({
    required this.errorMessage
});
}
