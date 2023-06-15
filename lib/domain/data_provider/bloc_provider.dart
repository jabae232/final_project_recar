import 'package:car_m/ui/screens/event_screen/data/event_bloc/event_bloc.dart';
import 'package:car_m/ui/screens/own_profile/data/bloc/own_profile_bloc.dart';
import 'package:car_m/ui/screens/own_profile/data/repo/own_profile_repo.dart';
import 'package:car_m/ui/screens/own_profile/widgets/club_screen/data/bloc/own_clubs_screen_bloc.dart';
import 'package:car_m/ui/screens/own_profile/widgets/club_screen/data/repo/repo.dart';
import 'package:car_m/ui/screens/own_profile/widgets/club_screen/ui/widgets/selected_club_screen/data/bloc/selected_club_bloc.dart';
import 'package:car_m/ui/screens/own_profile/widgets/club_screen/ui/widgets/selected_club_screen/data/repo/club_repo.dart';
import 'package:car_m/ui/screens/own_profile/widgets/club_screen/ui/widgets/selected_club_screen/ui/widgets/create_event_screen/data/repo/create_event_repo.dart';
import 'package:car_m/ui/screens/own_profile/widgets/followers/data/bloc/followers_bloc.dart';
import 'package:car_m/ui/screens/own_profile/widgets/followers/data/repo/repo.dart';
import 'package:car_m/ui/screens/own_profile/widgets/followings/data/bloc/following_screen_bloc.dart';
import 'package:car_m/ui/screens/own_profile/widgets/posts/data/bloc/own_post_bloc.dart';
import 'package:car_m/ui/screens/own_profile/widgets/posts/data/repo/post_repo.dart';
import 'package:car_m/ui/screens/own_profile/widgets/saves_screen/data/bloc/own_saves_bloc.dart';
import 'package:car_m/ui/screens/profile/data/bloc/profile_screen_bloc.dart';
import 'package:car_m/ui/screens/profile/data/repo/repo.dart';
import 'package:car_m/ui/screens/profile/widgets/followers/data/bloc/profile_followers_bloc.dart';
import 'package:car_m/ui/screens/search_page/ui/widgets/clubs/data/bloc/club_screen_bloc.dart';
import 'package:car_m/ui/screens/search_page/ui/widgets/clubs/data/repo/clubs_repo.dart';
import 'package:car_m/ui/screens/profile/widgets/comment_section/data/comment_section_profile_bloc.dart';
import 'package:car_m/ui/screens/search_page/ui/widgets/profile/repo/search_repo_profile.dart';
import 'package:car_m/ui/screens/search_page/ui/widgets/profile/search_for_profile_bloc/search_for_profile_bloc.dart';
import 'package:car_m/ui/screens/services/data/services_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../ui/screens/event_screen/data/repo/event_repo.dart';
import '../../ui/screens/own_profile/widgets/club_screen/ui/widgets/create_club_screen/ui/widgets/bloc/club_creation_bloc.dart';
import '../../ui/screens/own_profile/widgets/club_screen/ui/widgets/selected_club_screen/ui/widgets/create_event_screen/data/bloc/create_event_screen_bloc.dart';
import '../../ui/screens/own_profile/widgets/comment_section/data/bloc/comment_section_bloc.dart';
import '../../ui/screens/own_profile/widgets/comment_section/data/repo/comment_section_repo.dart';
import '../../ui/screens/profile/widgets/club_screen/data/bloc/profile_clubs_screen_bloc.dart';
import '../../ui/screens/profile/widgets/followings/data/bloc/profile_following_bloc.dart';
import '../../ui/screens/profile/widgets/post/data/post_profile_bloc.dart';
import '../../ui/screens/profile/widgets/saves_screen/data/save_profile_bloc.dart';

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CommentSectionBloc(
            repo: RepositoryProvider.of<RepoComments>(context),
          ),
        ),
        BlocProvider(
          create: (context) => CommentSectionProfileBloc(
            repo: RepositoryProvider.of<RepoComments>(context),
          ),
        ),
        BlocProvider(
          create: (context) => SearchForProfileBloc(
            repo: RepositoryProvider.of<RepoSearchProfile>(context),
          )..add(GetUsersEvent(query: '')),
        ),
        BlocProvider(
          create: (context) => ClubScreenBloc(
            repo: RepositoryProvider.of<RepoClubs>(context),
          )..add(GetClubsEvent()),
        ),
        BlocProvider(
          create: (context) => OwnPostBloc(
            repo: RepositoryProvider.of<RepoPostsProfile>(context),
          )..add(GetPostsEvent()),
        ),
        BlocProvider(
          create: (context) => OwnSavesBloc(
            repo: RepositoryProvider.of<RepoPostsProfile>(context),
          ),
        ),
        BlocProvider(
          create: (context) => EventBloc(
            repo: RepositoryProvider.of<RepoEvents>(context)
          ),
        ),
        BlocProvider(
          create: (context) => OwnProfileBloc(
            repo: RepositoryProvider.of<RepoOwnProfile>(context),
          )..add(GetOwnProfileEvent()),
        ),
        BlocProvider(
          create: (context) => ProfileScreenBloc(
            repo: RepositoryProvider.of<RepoProfile>(context),
          ),
        ),
        BlocProvider(
          create: (context) => FollowersBloc(
            repo: RepositoryProvider.of<RepoFollowers>(context),
          ),
        ),
        BlocProvider(
          create: (context) => ServicesBloc(
          )..add(GetServicesEvent()),
        ),
        BlocProvider(
          create: (context) => FollowingScreenBloc(
            repo: RepositoryProvider.of<RepoFollowers>(context),
          ),
        ),
        BlocProvider(
          create: (context) => ProfileFollowersBloc(
            repo: RepositoryProvider.of<RepoFollowers>(context),
          ),
        ),
        BlocProvider(
          create: (context) => ProfileFollowingBloc(
            repo: RepositoryProvider.of<RepoFollowers>(context),
          ),
        ),
        BlocProvider(
          create: (context) => PostProfileBloc(
            repo: RepositoryProvider.of<RepoPostsProfile>(context),
          ),
        ),
        BlocProvider(
          create: (context) => SaveProfileBloc(
            repo: RepositoryProvider.of<RepoPostsProfile>(context),
          ),
        ),
        BlocProvider(
          create: (context) => OwnClubsScreenBloc(
            repo: RepositoryProvider.of<RepoOwnClubs>(context),
          ),
        ),
        BlocProvider(
          create: (context) => ProfileClubsScreenBloc(
            repo: RepositoryProvider.of<RepoOwnClubs>(context),
          ),
        ),
        BlocProvider(
          create: (context) => ClubCreationBloc(
            repo: RepositoryProvider.of<RepoOwnClubs>(context),
          ),
        ),
        BlocProvider(
          create: (context) => SelectedClubBloc(
            repo: RepositoryProvider.of<RepoSelectedClub>(context),
          ),
        ),
        BlocProvider(
          create: (context) => CreateEventScreenBloc(
            repo: RepositoryProvider.of<RepoCreateEvent>(context)
          ),
        ),
      ],
      child: child,
    );
  }
}
