import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../posts/data/dto/posts_dto.dart';
import '../repo/repo.dart';

part 'own_clubs_screen_event.dart';
part 'own_clubs_screen_state.dart';

class OwnClubsScreenBloc extends Bloc<OwnClubsScreenEvent, OwnClubsScreenState> {
  final RepoOwnClubs repo;
  OwnClubsScreenBloc({
    required this.repo
}) : super(OwnClubsScreenInitial()) {
    on<GetOwnClubs>(_onGetClubs);
  }
  _onGetClubs(GetOwnClubs event, Emitter<OwnClubsScreenState> emitter) async{
    emit(OwnClubsScreenLoading());
    final clubsList = await repo.fetchClubs('');
    emit(OwnClubsScreenLoaded(clubs: clubsList));
  }
}
