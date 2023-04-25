import 'package:car_m/repository/models/profile/user.dart';
import 'package:car_m/resources/constants/notifierProvider.dart';
import 'package:flutter/material.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import 'others_profile_model.dart';
class OthersProfileWidget extends StatefulWidget {
  const OthersProfileWidget({Key? key}) : super(key: key);

  @override
  State<OthersProfileWidget> createState() => _OthersProfileWidgetState();
}

class _OthersProfileWidgetState extends State<OthersProfileWidget> {
  final model = OtherProfileWidgetModel();
  @override
  Widget build(BuildContext context) {
    model.loadUsers();
    return NotifierProvider(model: model,child: const _OthersProfileWidgetBody(),);
  }
}
class _OthersProfileWidgetBody extends StatelessWidget {
  const _OthersProfileWidgetBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<OtherProfileWidgetModel>(context);
    if(model == null) return const Center(child: CircularProgressIndicator(),);
    final int length = model.users.length;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return _OnePostRowWidget(profile: model.users[index],);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 9,
                );
              },
              itemCount: length),
        ),
      ),
    );
  }
}

class _OnePostRowWidget extends StatelessWidget {
  const _OnePostRowWidget({Key? key,required this.profile}) : super(key: key);
  final UserModel profile;
  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<OtherProfileWidgetModel>(context);
    return InkWell(
      onTap: () => model?.checkProfile(context, profile.id.toString()),
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
                        '${profile.fullName}',
                        style: AppStyles.s18w700.copyWith(
                            color: AppColors.mainBlack,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '@${profile.login}',
                        style: AppStyles.s16w400.copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              ]),
          ),
        ),
    );
  }
}
