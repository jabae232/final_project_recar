import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:car_m/secure_storage/shared_preferences.dart';
import 'package:car_m/ui/screens/search_page/ui/widgets/profile/dto/search_users.dart';
import 'package:car_m/ui/screens/search_page/ui/widgets/profile/repo/search_repo_profile.dart';
import 'package:meta/meta.dart';

part 'search_for_profile_event.dart';
part 'search_for_profile_state.dart';

class SearchForProfileBloc extends Bloc<SearchForProfileEvent, SearchForProfileState> {
  final RepoSearchProfile repo;
  SearchForProfileBloc({required this.repo}) : super(SearchForProfileInitial()) {
   on<GetUsersEvent>(_onGetUsers);
  }
  _onGetUsers(SearchForProfileEvent event, Emitter emitter) async {
    emit(SearchForProfileLoadingState());
    try{
      final usersList = await repo.fetch();
      final token = await SharedPrefModel().getToken();
      emit(SearchForProfileLoadedState(usersList: usersList,token: token));
    }
    catch(e){
      emit(SearchForProfileErrorState(errorMessage:'${e}'));
    }
  }
}
