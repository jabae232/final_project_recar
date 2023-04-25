import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_colors.dart';
import 'package:car_m/repository/models/profile/post/post.dart';
import 'package:car_m/resources/constants/notifierProvider.dart';
import 'package:car_m/ui/screens/own_profile/widgets/posts/post_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../constants/app_styles.dart';

class SinglePostWidget extends StatefulWidget {
  const SinglePostWidget({Key? key}) : super(key: key);

  @override
  State<SinglePostWidget> createState() => _SinglePostWidgetState();
}

class _SinglePostWidgetState extends State<SinglePostWidget> {
  final model = SinglePostWidgetModel(id: '');
  @override
  Widget build(BuildContext context) {
    return NotifierProvider(model: model, child: const _SinglePostWidgetBody());
  }
}

class _SinglePostWidgetBody extends StatelessWidget {
  const _SinglePostWidgetBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<SinglePostWidgetModel>(context);
    if (model == null) return const SizedBox.shrink();
    final postsList = model.posts;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return PostListRowWidget(
                  post: postsList[index],
                  model: model,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 9,
                );
              },
              itemCount: postsList.length),
        ),
      ),
    );
  }
}

class PostListRowWidget extends StatelessWidget {
  const PostListRowWidget({Key? key, required this.post,required this.model}) : super(key: key);
  final PostModel post;
  final model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
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
                    const CircleAvatar(),
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
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          post.createdAt ?? 'today',
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
                Row(
                  children: [
                    InkWell(
                      onTap: () => model?.savePost(post.id.toString()),
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
                              style:
                                  TextStyle(color: AppColors.iconButtonsNeutral),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
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
