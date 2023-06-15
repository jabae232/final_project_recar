import 'package:car_m/secure_storage/shared_preferences.dart';
import 'package:car_m/ui/screens/own_profile/widgets/comment_section/ui/widgets/all_comments.dart';
import 'package:car_m/ui/screens/own_profile/widgets/comment_section/ui/widgets/avatar_nickname_datetime_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';
import '../data/bloc/comment_section_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CommentSectionWidget extends StatefulWidget {
  const CommentSectionWidget({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  State<CommentSectionWidget> createState() => _CommentSectionWidgetState();
}

class _CommentSectionWidgetState extends State<CommentSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return _CommentSectionWidgetBody(
      id: widget.id,
    );
  }
}

class _CommentSectionWidgetBody extends StatelessWidget {
  const _CommentSectionWidgetBody({Key? key, required this.id})
      : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    FocusNode myfocus = FocusNode();
    final bloc = BlocProvider.of<CommentSectionBloc>(context)
      ..add(GetCommentsEvent(id: id));
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              actions: const [
                Icon(Icons.more_vert_outlined),
                SizedBox(
                  width: 10,
                ),
              ],
              leading: const BackButton(
                color: AppColors.mainBlack,
              ),
              elevation: 1,
              backgroundColor: AppColors.mainWhite,
              title: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${AppLocalizations.of(context)?.postOnWall}',
                    style:
                        AppStyles.s18w700.copyWith(color: AppColors.mainBlack),
                  )),
            ),
          ),
        ];
      },
      body: BlocBuilder<CommentSectionBloc, CommentSectionState>(
          builder: (context, state) {
        if (state is CommentSectionLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CommentSectionLoadedState) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    PostHeader(
                      id: state.commentsDto.author.id.toString(),
                      nickname: state.commentsDto.author.username,
                      username: state.commentsDto.author.fullName,
                      datetime: state.commentsDto.createdAt,
                      content: state.commentsDto.description,
                      avatar: state.commentsDto.author.avatar == null
                          ? ''
                          : 'http://89.223.100.35:8080${state.commentsDto.author.avatar?.dowloadUri}',
                      contentImage: state.commentsDto.postMedia.isEmpty
                          ? ''
                          : "http://89.223.100.35:8080${state.commentsDto.postMedia.first.mediaFile}",
                    ),
                    AllComments(
                      comments: state.commentsDto.postComments,
                      myfocus: myfocus,
                      textController: textController,
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration:
                        BoxDecoration(color: AppColors.mainWhite, boxShadow: [
                      BoxShadow(
                        color: AppColors.mainBlack.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, -1),
                      )
                    ]),
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9.0),
                          child: GestureDetector(
                            child: const Icon(
                              Icons.attach_file_outlined,
                              color: AppColors.iconButtonsNeutral,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            focusNode: myfocus,
                            controller: textController,
                            maxLines: null,
                            decoration: InputDecoration(
                                hintText:
                                    '${AppLocalizations.of(context)?.comment}',
                                border: InputBorder.none),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: GestureDetector(
                            child: const Icon(
                              Icons.send_sharp,
                              color: AppColors.iconButtonsNeutral,
                            ),
                            onTap: () async {
                              if (await SharedPrefModel().isReply() == "true") {
                                BlocProvider.of<CommentSectionBloc>(context)
                                  ..add(CommentReplyEvent(
                                      reply: textController.text,
                                      commentId:
                                          await SharedPrefModel().getComment()))
                                  ..add(GetCommentsEvent(id: id));
                                await SharedPrefModel().setReply('false', '0');
                              } else {
                                BlocProvider.of<CommentSectionBloc>(context)
                                  ..add(PostCommentEvent(
                                      id: id, content: textController.text))
                                  ..add(GetCommentsEvent(id: id));
                              }
                              textController.text = '';
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          );
        }
        return const Text('mistake');
      }),
    ));
  }
}
