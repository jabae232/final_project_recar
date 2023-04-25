import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:car_m/resources/constants/notifierProvider.dart';
import 'package:car_m/ui/screens/own_profile/widgets/create_post_widget/create_post_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import '../../../../../constants/app_colors.dart';

class CreatePostWidgetProfile extends StatefulWidget {
  const CreatePostWidgetProfile({Key? key}) : super(key: key);

  @override
  State<CreatePostWidgetProfile> createState() =>
      _CreatePostWidgetProfileState();
}

class _CreatePostWidgetProfileState extends State<CreatePostWidgetProfile> {
  final model = CreatePostWidgetModel();
  @override
  Widget build(BuildContext context) {
    return NotifierProvider(
      model: model,
      child: const _CreatePostWidgetBody(),
    );
  }
}

class _CreatePostWidgetBody extends StatelessWidget {
  const _CreatePostWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<CreatePostWidgetModel>(context);
    if (model == null) return const SizedBox.shrink();
    var _pickedFile = model.image;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainBlack,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppAssets.svg.quit),
        ),
        title: Text(
          '${AppLocalizations.of(context)?.newPost}',
          style: AppStyles.s21w500,
        ),
        actions: [
          IconButton(
            onPressed: () => model.getImage(context),
            icon: const Icon(Icons.photo),
          ),
          IconButton(
            onPressed: () => model.uploadPost(context),
            icon: const Icon(Icons.check),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) =>
                  model.content = value,
              autofocus: true,
              minLines: null,
              maxLines: null,
              expands: true,
              decoration: InputDecoration(
                hintText: '${AppLocalizations.of(context)?.whatsNew}',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            child: _pickedFile != null
                ? Column(
              children: [
                Image(image: Image.file(File(_pickedFile!.path,), fit: BoxFit.cover,).image,height: 200,),
                const SizedBox(height: 10,),
              ],
            )
                : Text("${AppLocalizations.of(context)?.imageWasNotSelected}"),
          ),
        ],
      ),
    );
  }
}
