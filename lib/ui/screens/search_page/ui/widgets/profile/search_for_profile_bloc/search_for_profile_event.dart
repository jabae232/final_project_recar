part of 'search_for_profile_bloc.dart';

@immutable
abstract class SearchForProfileEvent {}
class GetUsersEvent extends SearchForProfileEvent{
  final String query;
  GetUsersEvent({
    required this.query
});
}