part of 'services_bloc.dart';

@immutable
abstract class ServicesState {}

class ServicesInitial extends ServicesState {}
class ServicesLoading extends ServicesState {}
class ServicesLoaded extends ServicesState {
  final String locale;
  ServicesLoaded({
    required this.locale
});
}
