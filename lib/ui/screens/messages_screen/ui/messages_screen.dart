import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/ui/screens/messages_screen/ui/widgets/chat_screen/ui/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return const MessagesBody();
  }
}

class MessagesBody extends StatelessWidget {
  const MessagesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SvgPicture.asset(AppAssets.svg.pencil),
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
              title: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${AppLocalizations.of(context)?.messages}',
                    style: AppStyles.s18w700
                        .copyWith(color: AppColors.mainBlack, fontSize: 20),
                  )),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainWhite,
                     shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {},
                    child: Text('${AppLocalizations.of(context)?.all}', style: AppStyles.s14w400.copyWith(color: AppColors.mainBlack)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainWhite,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {},
                        child: Text('${AppLocalizations.of(context)?.recent}', style: AppStyles.s14w400.copyWith(color: AppColors.mainBlack))),
                  ),
                ],
              ),
              Expanded(
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.separated(itemBuilder: (context,index) {
                    return SingleMessage(datetime: '$index',fullName: 'Abylay Aidarov',lastMessage: 'Hello',);
                  },
                  itemCount: 10, separatorBuilder: (BuildContext context, int index) {
                    return Container(height: 0.3,color: Colors.grey,);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleMessage extends StatelessWidget {
  const SingleMessage({Key? key,required this.datetime,required this.fullName,required this.lastMessage}) : super(key: key);
  final String fullName;
  final String lastMessage;
  final String datetime;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 22),
      child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
          },
        child: Container(
          child: Row(
            children: [
              CircleAvatar(),
              const SizedBox(width: 18,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fullName,style: AppStyles.s18w500roboto.copyWith(color: AppColors.mainBlack,fontWeight: FontWeight.w500),),
                  Text(lastMessage,style: AppStyles.s18w500roboto.copyWith(color: AppColors.messages,fontWeight: FontWeight.w400,fontSize: 16),),
                ],
              ),
               const Expanded(child: SizedBox()),
               Text("$datetime hr",style: AppStyles.s18w500roboto.copyWith(color: AppColors.messages,fontWeight: FontWeight.w400,fontSize:14),),
            ],
          ),
        ),
      ),
    );
  }
}

