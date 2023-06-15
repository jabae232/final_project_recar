import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../widgets/posts/data/dto/posts_dto.dart';
import '../repo/own_profile_repo.dart';

part 'own_profile_event.dart';
part 'own_profile_state.dart';

class OwnProfileBloc extends Bloc<OwnProfileEvent, OwnProfileState> {
  final RepoOwnProfile repo;
  OwnProfileBloc({required this.repo}) : super(OwnProfileInitial()) {
    on<GetOwnProfileEvent>(_onGetProfile);
  }
  _onGetProfile(GetOwnProfileEvent event,Emitter<OwnProfileState> emitter)async{
    emit(OwnProfileLoadingState());
      final profile = await repo.fetch();
      emit(OwnProfileLoadedState(profile: profile));
  }
}
