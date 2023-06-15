import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../posts/data/dto/posts_dto.dart';
import '../../../posts/data/repo/post_repo.dart';

part 'own_saves_event.dart';
part 'own_saves_state.dart';

class OwnSavesBloc extends Bloc<OwnSavesEvent, OwnSavesState> {
  final RepoPostsProfile repo;
  OwnSavesBloc({required this.repo}) : super(OwnSavesInitial()) {
    on<GetSavesEvent>(_onGetSaves);
  }
  _onGetSaves(GetSavesEvent event, Emitter<OwnSavesState> emitter)async{
    emit(OwnSavesLoading());
    final savesList = await repo.fetchSaves('');
    emit(OwnSavesLoaded(savesList: savesList));
    try{
    }catch(e){
      emit(OwnSavesError(errorMessage: 'Nothing to see here'));
    }
  }
}
