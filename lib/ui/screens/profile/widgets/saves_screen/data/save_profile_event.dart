part of 'save_profile_bloc.dart';

@immutable
abstract class SaveProfileEvent {}
class GetSavesEvent extends SaveProfileEvent{
  final String id;
  GetSavesEvent({
    required this.id
});
}