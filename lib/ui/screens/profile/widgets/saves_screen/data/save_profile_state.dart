part of 'save_profile_bloc.dart';

@immutable
abstract class SaveProfileState {}

class SaveProfileInitial extends SaveProfileState {}
class SaveProfileLoadingState extends SaveProfileState {}
class SaveProfileLoadedState extends SaveProfileState {
  final List<Like> savesList;
  SaveProfileLoadedState({
    required this.savesList
  });
}
class SaveProfileErrorState extends SaveProfileState {
  final String errorMessage;
  SaveProfileErrorState({
    required this.errorMessage
  });
}
