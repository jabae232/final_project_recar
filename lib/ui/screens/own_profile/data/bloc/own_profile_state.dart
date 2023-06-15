part of 'own_profile_bloc.dart';

@immutable
abstract class OwnProfileState {}

class OwnProfileInitial extends OwnProfileState {}
class OwnProfileLoadingState extends OwnProfileState {}
class OwnProfileLoadedState extends OwnProfileState {
  final ProfileDto profile;
  OwnProfileLoadedState({
    required this.profile
});
}
class OwnProfileErrorState extends OwnProfileState {}
