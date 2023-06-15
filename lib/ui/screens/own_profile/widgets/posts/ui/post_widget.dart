import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_colors.dart';
import 'package:car_m/ui/screens/own_profile/widgets/posts/data/bloc/own_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../constants/app_styles.dart';
import '../../../../../../date_formatter/date_formatter.dart';
import '../../comment_section/ui/comment_section.dart';
import '../data/dto/posts_dto.dart';

class PostWidgets extends StatefulWidget {
  const PostWidgets({Key? key}) : super(key: key);

  @override
  State<PostWidgets> createState() => _SinglePostWidgetState();
}

class _SinglePostWidgetState extends State<PostWidgets> {
  @override
  void initState() {
    BlocProvider.of<OwnPostBloc>(context).add(GetPostsEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const _SinglePostWidgetBody();
  }
}

class _SinglePostWidgetBody extends StatelessWidget {
  const _SinglePostWidgetBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body : BlocBuilder<OwnPostBloc, OwnPostState>(
      builder: (context, state) {
        if(state is OwnPostLoadingState){
          return const Center(child: CircularProgressIndicator(),);
        } if(state is OwnPostLoadedState) {
          print('${state.postList.length}');
          if(state.postList.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return PostListRowWidgets(
                          post: state.postList[index],
                        );
                      },
                      itemCount: state.postList.length),
                ),
              );
            } else {
            return Text('Nothing to see here',style: AppStyles.s24w700.copyWith(color: AppColors.buttonNeutral),);
          }

        } if(state is OwnPostErrorState) {
          return Center(child: Text(state.errorMessage),);
        }
        return const SizedBox.shrink();
      },
    )
    );
  }
}

class PostListRowWidgets extends StatelessWidget {
  const PostListRowWidgets({Key? key, required this.post})
      : super(key: key);
  final Like post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.mainWhite,
            border: Border.all(color: Colors.black.withOpacity(0.01)),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 4,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                      post.author.avatar == null
                          ? AssetImage(AppAssets.images.testNews)
                      as ImageProvider
                          : NetworkImage(
                        'http://89.223.100.35:8080${post.author.avatar?.dowloadUri}',
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '@${post.author.username}',
                          style: AppStyles.s18w700.copyWith(
                              color: AppColors.mainBlack,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        Text(
                          DateFormatter().getProperDate(
                             post.createdAt,
                              context),
                          style:
                              AppStyles.s16w400.copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.blueNeutral,
                          border:
                              Border.all(color: Colors.black.withOpacity(0.01)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: SvgPicture.asset(
                          AppAssets.svg.quit,
                          color: AppColors.iconButtonsNeutral,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text('${post.description}')),
                post.postMedia.isNotEmpty ?
                Image.network(
                  'http://89.223.100.35:8080${post.postMedia.first.mediaFile}',
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const CircularProgressIndicator();
                  },
                ) : SizedBox.shrink(),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        BlocProvider.of<OwnPostBloc>(context)..add(SavePostEvent(postId: post.id.toString()));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.blueNeutral,
                          border:
                              Border.all(color: Colors.black.withOpacity(0.01)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: SvgPicture.asset(AppAssets.svg.likesNews,
                                    color: AppColors.iconButtonsNeutral)),
                            const Text(
                              '0',
                              style: TextStyle(
                                  color: AppColors.iconButtonsNeutral),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CommentSectionWidget(id: post.id)));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.blueNeutral,
                          border:
                              Border.all(color: Colors.black.withOpacity(0.01)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: SvgPicture.asset(
                          AppAssets.svg.commentNews,
                          color: AppColors.iconButtonsNeutral,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.blueNeutral,
                          border:
                              Border.all(color: Colors.black.withOpacity(0.01)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: SvgPicture.asset(
                                  AppAssets.svg.shareNews,
                                  color: AppColors.iconButtonsNeutral,
                                )),
                            const Text('0',
                                style: TextStyle(
                                    color: AppColors.iconButtonsNeutral)),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
