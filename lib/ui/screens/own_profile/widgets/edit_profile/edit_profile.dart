import 'dart:io';
import 'package:car_m/resources/constants/notifierProvider.dart';
import 'package:car_m/ui/screens/own_profile/widgets/edit_profile/edit_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final model = EditProfileModel();
    return NotifierProvider(
        model: model, child: const _EditProfileScreenBody());
  }
}

class _EditProfileScreenBody extends StatefulWidget {
  const _EditProfileScreenBody({Key? key}) : super(key: key);

  @override
  State<_EditProfileScreenBody> createState() => _EditProfileScreenBodyState();
}

class _EditProfileScreenBodyState extends State<_EditProfileScreenBody> {
  File? _image;
  PickedFile? _pickedFile;
  final _picker = ImagePicker();
  Future<void> _pickImage() async {
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      setState(() {
        _image = File(_pickedFile!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(
          color: Colors.blue,
        ),
        title: Text("${AppLocalizations.of(context)?.changeAvatar}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainBlack
              ),
                onPressed: _pickImage, child: Text("${AppLocalizations.of(context)?.selectImage}")),
            const SizedBox(height: 10,),
            Container(
              child: _pickedFile != null
                  ? Column(
                    children: [
                      ClipRect(
                          clipBehavior: Clip.hardEdge,
                          child: CircleAvatar(
                            backgroundImage:
                                Image.file(File(_pickedFile!.path,), fit: BoxFit.cover,).image,
                            radius: 100,
                          )),
                      const SizedBox(height: 10,),
                      ElevatedButton(
                          style:ElevatedButton.styleFrom(
                              backgroundColor: AppColors.mainBlack
                          ),
                          onPressed: _pickImage, child: Text("${AppLocalizations.of(context)?.upload}")),
                    ],
                  )
                  : Text("${AppLocalizations.of(context)?.imageWasNotSelected}"),
            ),
          ],
        ),
      ),
    );
  }
}
