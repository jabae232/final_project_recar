import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_colors.dart';
import 'package:car_m/ui/screens/profile/widgets/post/data/post_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../constants/app_styles.dart';
import '../../../../../../date_formatter/date_formatter.dart';
import '../../../../own_profile/widgets/posts/data/dto/posts_dto.dart';
import '../../comment_section/ui/comment_section.dart';


class PostWidgetProfile extends StatefulWidget {
  const PostWidgetProfile({Key? key,required this.id}) : super(key: key);
  final String id;
  @override
  State<PostWidgetProfile> createState() => _PostWidgetProfileState();
}

class _PostWidgetProfileState extends State<PostWidgetProfile> {
  @override
  void initState() {
    BlocProvider.of<PostProfileBloc>(context).add(GetPostsProfileEvent(id: widget.id));
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
        body : BlocBuilder<PostProfileBloc, PostProfileState>(
          builder: (context, state) {
            if(state is PostProfileLoadingState){
              return const Center(child: CircularProgressIndicator(),);
            } if(state is PostProfileLoadedState) {
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
                return Center(child: Text('Nothing to see here',style: AppStyles.s24w700.copyWith(color: AppColors.iconButtonsNeutral),));
              }

            } if(state is PostProfileError) {
              return const Center(child: Text('Something went wrong'),);
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
                        BlocProvider.of<PostProfileBloc>(context)..add(SavePostsProfileEvent(id: post.id.toString()));
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
                                    CommentSectionProfileWidget(id: post.id)));
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