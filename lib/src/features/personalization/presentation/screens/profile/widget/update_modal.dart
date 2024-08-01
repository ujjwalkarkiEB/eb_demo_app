import 'dart:io';

import 'package:eb_demo_app/core/common/widgets/snackbars/error_snackbar.dart';
import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:eb_demo_app/src/features/personalization/presentation/bloc/personalization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileModal extends StatefulWidget {
  const UpdateProfileModal({super.key});

  @override
  UpdateProfileModalState createState() => UpdateProfileModalState();
}

class UpdateProfileModalState extends State<UpdateProfileModal> {
  final _formKey = GlobalKey<FormState>();
  File? _pickedImage;
  String? bio;

  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    _bioController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    _formKey.currentState!.save();

    if (_pickedImage == null && bio == null) {
      showFlashError(context, "You are required to provide input!");
      return;
    }

    context
        .read<PersonalizationBloc>()
        .add(ProfileUpdateEvent(avatar: _pickedImage?.path, bio: bio));
    Navigator.of(context).pop();
  }

  void _pickAvatar({bool isgallery = true}) async {
    final picker = ImagePicker();
    final XFile? imgFile = await picker.pickImage(
      source: isgallery ? ImageSource.gallery : ImageSource.camera,
      maxHeight: 200,
      maxWidth: 200,
      imageQuality: 100,
    );

    if (imgFile == null) {
      return;
    }

    setState(() {
      _pickedImage = File(imgFile.path);
    });
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickAvatar();
              },
              child: const Text('Select from Gallery'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickAvatar(isgallery: false);
              },
              child: const Text('Take a Photo'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Edit Profile',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: _pickedImage == null
                      ? const AssetImage(AppImages.userImage)
                      : FileImage(_pickedImage!),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.camera),
                    TextButton(
                      onPressed: _showImagePickerOptions,
                      child: const Text('Add picture'),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _bioController,
              decoration: const InputDecoration(labelText: 'Bio'),
              maxLines: 3,
              onSaved: (newValue) {
                if (newValue != null) {
                  bio = newValue;
                }
              },
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
