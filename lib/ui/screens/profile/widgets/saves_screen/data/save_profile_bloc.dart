import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../own_profile/widgets/posts/data/dto/posts_dto.dart';
import '../../../../own_profile/widgets/posts/data/repo/post_repo.dart';

part 'save_profile_event.dart';
part 'save_profile_state.dart';

class SaveProfileBloc extends Bloc<SaveProfileEvent, SaveProfileState> {
  final RepoPostsProfile repo;
  SaveProfileBloc({
    required this.repo
}) : super(SaveProfileInitial()) {
    on<GetSavesEvent>(_onGetSaves);
  }
  _onGetSaves(GetSavesEvent event, Emitter<SaveProfileState> emitter)async {
    emit(SaveProfileLoadingState());
    print('${event.id} EVENTID');
    final saves = await repo.fetchSaves(event.id);
    emit(SaveProfileLoadedState(savesList: saves));
  }
}
