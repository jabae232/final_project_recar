import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../dto/clubs.dart';
import '../repo/clubs_repo.dart';

part 'club_screen_event.dart';
part 'club_screen_state.dart';

class ClubScreenBloc extends Bloc<ClubScreenEvent, ClubScreenState> {
  final RepoClubs repo;
  ClubScreenBloc({required this.repo}) : super(ClubScreenInitial()) {
    on<GetClubsEvent>(_onGetClubs);
    on<ClubSubEvent>(_onSub);
  }
  _onGetClubs(GetClubsEvent event, Emitter<ClubScreenState> emitter)async{
    emit(ClubScreenLoadingState());
    try{
      final clubsList = await repo.fetch();
      emit(ClubScreenLoadedState(clubsList: clubsList));
    } catch(e){
      emit(ClubScreenErrorState(errorMessage:'${e}'));
    }
  }
  _onSub(ClubSubEvent event, Emitter<ClubScreenState> emitter)async{
    try{
      await repo.subscribe(event.id);
    } catch(e){
      emit(ClubScreenErrorState(errorMessage:'${e}'));
    }
  }
}
