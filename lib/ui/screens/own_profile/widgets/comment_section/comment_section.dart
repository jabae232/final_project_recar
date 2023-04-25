import 'package:car_m/ui/screens/own_profile/widgets/comment_section/comment_section_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';

class CommentConfiguration {
  final int postId;
  final String date;
  final String content;
  final int likes;
  final int shares;
  final String author;
  CommentConfiguration({
    required this.postId,
    required this.date,
    required this.content,
    required this.likes,
    required this.author,
    required this.shares,
  });
}

class CommentSectionWidget extends StatefulWidget {
  const CommentSectionWidget({Key? key, required this.configuration})
      : super(key: key);
  final CommentConfiguration configuration;

  @override
  State<CommentSectionWidget> createState() => _CommentSectionWidgetState();
}

class _CommentSectionWidgetState extends State<CommentSectionWidget> {
  late final model;
  @override
  void initState() {
    model = CommentSectionWidgetModel();
    model.postId(widget.configuration.postId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CommentSectionWidgetProvider(
        model: model,
        child: _CommentSectionWidgetBody(
          post: widget.configuration,
        ));
  }
}

class _CommentSectionWidgetBody extends StatelessWidget {
  const _CommentSectionWidgetBody({Key? key, required this.post})
      : super(key: key);
  final CommentConfiguration post;
  @override
  Widget build(BuildContext context) {
    CommentSectionWidgetProvider.read(context)?.model.setup();
    final int length = CommentSectionWidgetProvider.watch(context)?.model.exactComments.length ?? 0;
    return Scaffold(
      /*bottomNavigationBar: BottomAppBar(
        color: AppColors.checkStoryMainBlack,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_photo_alternate_outlined,
                    color: AppColors.mainWhite,
                  )),
              Expanded(
                  child: TextField(
                    onChanged: (value) => CommentSectionWidgetProvider.read(context)
                        ?.model
                        .content = value,
                    style: const TextStyle(color: AppColors.mainWhite),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15.0),
                      hintText: '${AppLocalizations.of(context)?.typeSomeText}',
                      hintStyle: const TextStyle(color: AppColors.mainWhite),
                      border: InputBorder.none,
                    ),
                  )),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () => CommentSectionWidgetProvider.read(context)
                      ?.model
                      .writeComment(),
                  icon: SvgPicture.asset(AppAssets.svg.postComment)),
            ],
          ),
        ),
      ),*/
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: const BackButton(),
              backgroundColor: AppColors.mainBlack,
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        child: Text(
                            '${AppLocalizations.of(context)?.addToBookMarks}')),
                    PopupMenuItem(
                        child:
                            Text('${AppLocalizations.of(context)?.copyLink}')),
                    PopupMenuItem(
                        child: Text('${AppLocalizations.of(context)?.report}')),
                  ],
                )
              ],
              title: Text('${AppLocalizations.of(context)?.postOnWall}'),
              pinned: false,
              snap: true,
              floating: true,
              elevation: 2,
            ),
          ];
        },
        body: Stack(
          children: [Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                              '@${post.author}',
                              style: AppStyles.s18w700.copyWith(
                                  color: AppColors.mainBlack,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              post.date,
                              style: AppStyles.s16w400
                                  .copyWith(color: Colors.black54),
                            ),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(post.content)),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.blueNeutral,
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.01)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 5),
                                    child: SvgPicture.asset(
                                        AppAssets.svg.likesNews,
                                        color: AppColors.iconButtonsNeutral)),
                                Text(
                                  '${post.likes}',
                                  style: const TextStyle(
                                      color: AppColors.iconButtonsNeutral),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
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
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.01)),
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
                                Text('${post.shares}',
                                    style: const TextStyle(
                                        color: AppColors.iconButtonsNeutral)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey,
                        )),
                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return _CommentsListWidget(
                            index: index,
                          );
                        },
                        itemCount: length,
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: AppColors.mainBlack,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_photo_alternate_outlined,
                            color: AppColors.mainWhite,
                          )),
                      Expanded(
                          child: TextField(
                            textCapitalization: TextCapitalization.sentences,
                            onChanged: (value) => CommentSectionWidgetProvider.read(context)
                                ?.model
                                .content = value,
                            style: const TextStyle(color: AppColors.mainWhite),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(15.0),
                              hintText: '${AppLocalizations.of(context)?.typeSomeText}',
                              hintStyle: const TextStyle(color: AppColors.mainWhite),
                              border: InputBorder.none,
                            ),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                          onPressed: () => CommentSectionWidgetProvider.read(context)
                              ?.model
                              .writeComment(context),
                          icon: SvgPicture.asset(AppAssets.svg.postComment)),
                    ],
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class _CommentsListWidget extends StatelessWidget {
  const _CommentsListWidget({Key? key,required this.index})
      : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final comment = CommentSectionWidgetProvider.watch(context)!.model.exactComments?[index];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.all(10), child: CircleAvatar()),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text('@${comment!.author}')),
            Text(comment.content),
            Row(
              children: [
                Text(comment.date),
                TextButton(
                  onPressed: () {},
                  child: Text('${AppLocalizations.of(context)?.reply}'),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.heart_broken_sharp,
                      color: Colors.red,
                    ))
              ],
            )
          ],
        )
      ],
    );
  }
}
