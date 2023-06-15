import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/ui/screens/messages_screen/ui/widgets/chat_screen/ui/widgets/chat_friend.dart';
import 'package:car_m/ui/screens/messages_screen/ui/widgets/chat_screen/ui/widgets/chat_self.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../../constants/app_styles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return const ChatBody();
  }
}

class ChatBody extends StatelessWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.phone,
                      color: AppColors.activeStoryIcon,
                    ),
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.videocam_rounded,
                        color: AppColors.activeStoryIcon,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    color: AppColors.mainBlack,
                    size: 24,
                  ),
                ),
                elevation: 1,
                backgroundColor: AppColors.background,
                title: Row(
                  children: [
                    CircleAvatar(),
                    const SizedBox(
                      width: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sara Pasaq',
                          style: AppStyles.s18w500roboto
                              .copyWith(color: AppColors.mainBlack),
                        ),
                        Text('Offline',
                            style: AppStyles.s18w500roboto.copyWith(
                                color: AppColors.messages,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ],
                    )
                  ],
                )),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    ChatSelf(
                      message: 'helloopaskpdnmaskpdnapw ',
                    ),
                    ChatSelf(message: 'helloopaskpdnmaskpdnapw ,'),
                    ChatFriend(message: 'helloopaskpdnmaskpdna'),
                    ChatFriend(message: 'helloopaskpdnmaskpdnapw ,'),
                    ChatFriend(message: 'helloopaskpdnmaskpdnapw ,'),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          enabled: true,
                          decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.message,
                              fillColor: AppColors.mainWhite,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      const BorderSide(color: Colors.blue))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SvgPicture.asset(AppAssets.svg.sendMessage),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
