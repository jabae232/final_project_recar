import 'package:car_m/ui/screens/profile/widgets/post/ui/post_widget_profile.dart';
import 'package:car_m/ui/screens/profile/widgets/saves_screen/data/save_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';

class SavesScreenProfile extends StatefulWidget {
  const SavesScreenProfile({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<SavesScreenProfile> createState() => _SavesScreenProfileState();
}

class _SavesScreenProfileState extends State<SavesScreenProfile> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SaveProfileBloc>(context).add(GetSavesEvent(id: widget.id));
    return const _SavesScreenBody();
  }
}

class _SavesScreenBody extends StatelessWidget {
  const _SavesScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<SaveProfileBloc, SaveProfileState>(
        builder: (context, state) {
          if (state is SaveProfileLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SaveProfileLoadedState) {
            if (state.savesList.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return PostListRowWidgets(
                          post: state.savesList[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          height: 9,
                        );
                      },
                      itemCount: state.savesList.length),
                ),
              );
            } else {
              return Center(
                  child: Text(
                'Nothing to see here',
                style: AppStyles.s24w700
                    .copyWith(color: AppColors.iconButtonsNeutral),
              ));
            }
          }
          if (state is SaveProfileErrorState) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
