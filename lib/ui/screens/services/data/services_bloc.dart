import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../secure_storage/shared_preferences.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  ServicesBloc() : super(ServicesInitial()) {
    on<GetServicesEvent>(_onGetServices);
  }
  _onGetServices(GetServicesEvent event,Emitter<ServicesState> emitter) async{
    emit(ServicesLoading());
    final locale = await SharedPrefModel().readLocale();
    emit(ServicesLoaded(locale: locale ?? 'en_US'));
  }
}
