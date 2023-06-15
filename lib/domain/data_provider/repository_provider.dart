import 'package:car_m/ui/screens/event_screen/data/repo/event_repo.dart';
import 'package:car_m/ui/screens/own_profile/data/repo/own_profile_repo.dart';
import 'package:car_m/ui/screens/own_profile/widgets/club_screen/data/repo/repo.dart';
import 'package:car_m/ui/screens/own_profile/widgets/club_screen/ui/widgets/selected_club_screen/ui/widgets/create_event_screen/data/repo/create_event_repo.dart';
import 'package:car_m/ui/screens/own_profile/widgets/followers/data/repo/repo.dart';
import 'package:car_m/ui/screens/own_profile/widgets/posts/data/repo/post_repo.dart';
import 'package:car_m/ui/screens/profile/data/repo/repo.dart';
import 'package:car_m/ui/screens/search_page/ui/widgets/clubs/data/repo/clubs_repo.dart';
import 'package:car_m/ui/screens/search_page/ui/widgets/profile/repo/search_repo_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../api/api.dart';
import '../../ui/screens/own_profile/widgets/club_screen/ui/widgets/selected_club_screen/data/repo/club_repo.dart';
import '../../ui/screens/own_profile/widgets/comment_section/data/repo/comment_section_repo.dart';
class ReposProvider extends StatelessWidget {
  const ReposProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Api(),
        ),
        Provider(
          create: (context) => RepoComments(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoSearchProfile(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoClubs(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoPostsProfile(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoOwnProfile(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoProfile(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoFollowers(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoOwnClubs(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoSelectedClub(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoCreateEvent(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoEvents(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
      ],
      child: child,
    );
  }
}