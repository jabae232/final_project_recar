import 'dart:io';
import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:car_m/repository/repo/repo.dart';
import 'package:car_m/resources/constants/notifierProvider.dart';
import 'package:car_m/ui/screens/own_profile/data/bloc/own_profile_bloc.dart';
import 'package:car_m/ui/screens/own_profile/ui/own_profile_screen.dart';
import 'package:car_m/ui/screens/own_profile/widgets/edit_profile/edit_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key,required this.fullName}) : super(key: key);
  final String fullName;
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final model = EditProfileModel();
    return NotifierProvider(
        model: model, child: _EditProfileScreenBody(fullName: widget.fullName,));
  }
}

class _EditProfileScreenBody extends StatefulWidget {
  const _EditProfileScreenBody({Key? key,required this.fullName}) : super(key: key);
  final String fullName;
  @override
  State<_EditProfileScreenBody> createState() => _EditProfileScreenBodyState();
}

class _EditProfileScreenBodyState extends State<_EditProfileScreenBody> {
  File? _image;
  File? _backGroundImage;
  PickedFile? _pickedFile;
  PickedFile? _pickedBackground;
  final _picker = ImagePicker();
  final _pickerBackground = ImagePicker();
  Future<void> _pickImage() async {
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      setState(() {
        _image = File(_pickedFile!.path);
      });
    }
  }

  Future<void> _pickBackgroundImage() async {
    _pickedBackground = await _pickerBackground.getImage(source: ImageSource.gallery);
    if (_pickedBackground != null) {
      setState(() {
        _backGroundImage = File(_pickedBackground!.path);
      });
    }
  }

  Future<void> _uploadImage(context) async {
    await RecarRepository().uploadAvatar(_image);
    Navigator.pop(context);
  }
  Future<void> _uploadBackground(context) async {
    await RecarRepository().uploadBackground(_backGroundImage);
    Navigator.pop(context);
  }
  void upload(context) async{
    if(_backGroundImage != null && _image != null) {
      await RecarRepository().uploadBackground(_backGroundImage);
      await RecarRepository().uploadAvatar(_image);
      BlocProvider.of<OwnProfileBloc>(context).add(GetOwnProfileEvent());
      Navigator.pop(context);
    } else if(_backGroundImage != null) {
      await RecarRepository().uploadBackground(_backGroundImage);
      BlocProvider.of<OwnProfileBloc>(context).add(GetOwnProfileEvent());
      Navigator.pop(context);
    } else if(_image != null) {
      await RecarRepository().uploadAvatar(_image);
      BlocProvider.of<OwnProfileBloc>(context).add(GetOwnProfileEvent());
      Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text("${AppLocalizations.of(context)?.changeAvatar}"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainBlack),
                        onPressed: _pickImage,
                        child: Text(
                            "${AppLocalizations.of(context)?.selectImageAvatar}")),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: Column(
                      children: [
                        ClipRect(
                            clipBehavior: Clip.hardEdge,
                            child: CircleAvatar(
                              backgroundImage: _pickedFile != null
                                  ? Image.file(
                                      File(
                                        _pickedFile!.path,
                                      ),
                                      fit: BoxFit.cover,
                                    ).image
                                  : AssetImage(AppAssets.images.testProfile),
                              radius: 100,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainBlack),
                        onPressed: _pickBackgroundImage,
                        child: FittedBox(
                          child: Text(
                              "${AppLocalizations.of(context)?.selectImageBackground}"),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        image: _backGroundImage !=null ? DecorationImage(
                          image: FileImage(_backGroundImage!),
                          fit: BoxFit.fitWidth
                        ) :
                            DecorationImage(image: AssetImage(AppAssets.images.testBackGroundProfile), fit: BoxFit.fitWidth),
                        color: AppColors.mainWhite,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 15,
                            offset: const Offset(0, 7),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Text(widget.fullName,style: AppStyles.s24w700,),
          _pickedFile != null || _backGroundImage !=null
              ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainBlack),
              onPressed: () => upload(context),
              child:
              Text("${AppLocalizations.of(context)?.upload}"))
              : Text(
              "${AppLocalizations.of(context)?.imageWasNotSelected}"),
        ],
      ),
    );
  }
}
