part of 'search_for_profile_bloc.dart';

@immutable
abstract class SearchForProfileState {}

class SearchForProfileInitial extends SearchForProfileState {}
class SearchForProfileLoadingState extends SearchForProfileState {}
class SearchForProfileLoadedState extends SearchForProfileState {
  final List<Users> usersList;
  final String token;
  SearchForProfileLoadedState({
    required this.usersList,required this.token
});
}
class SearchForProfileErrorState extends SearchForProfileState {
  final String errorMessage;
  SearchForProfileErrorState({
    required this.errorMessage
});
}