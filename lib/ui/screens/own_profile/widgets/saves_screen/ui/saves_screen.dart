import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants/app_colors.dart';
import '../../posts/ui/post_widget.dart';
import '../data/bloc/own_saves_bloc.dart';

class SavesScreen extends StatefulWidget {
  const SavesScreen({Key? key}) : super(key: key);

  @override
  State<SavesScreen> createState() => _SavesScreenState();
}

class _SavesScreenState extends State<SavesScreen> {
  @override
  void initState() {
    BlocProvider.of<OwnSavesBloc>(context).add(GetSavesEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const _SavesScreenBody();
  }
}

class _SavesScreenBody extends StatelessWidget {
  const _SavesScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<OwnSavesBloc, OwnSavesState>(
        builder: (context, state) {
          if (state is OwnSavesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is OwnSavesLoaded) {
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
          }
          if (state is OwnSavesError) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
