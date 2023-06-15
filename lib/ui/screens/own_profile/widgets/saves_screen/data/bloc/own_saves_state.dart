part of 'own_saves_bloc.dart';

@immutable
abstract class OwnSavesState {}

class OwnSavesInitial extends OwnSavesState {}
class OwnSavesError extends OwnSavesState {
  final String errorMessage;
  OwnSavesError({
    required this.errorMessage
});
}
class OwnSavesLoading extends OwnSavesState {}
class OwnSavesLoaded extends OwnSavesState {
  final List<Like> savesList;
  OwnSavesLoaded({
    required this.savesList
});
}
