import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/store/store_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final List<String> _pickedImages = [];

  Future<void> _pickImages({bool isGallery = true}) async {
    final ImagePicker imagePicker = ImagePicker();
    final List<XFile>? imgFiles = await imagePicker.pickMultiImage(
      maxHeight: 200,
      maxWidth: 200,
      imageQuality: 100,
    );
    if (imgFiles == null || imgFiles.isEmpty) {
      return;
    }
    setState(() {
      _pickedImages.addAll(imgFiles.map((file) => file.path));
      context.read<StoreBloc>().pickedProductImages = _pickedImages;
    });
  }

  void _showImagePickerOptions() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose an option'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImages();
              },
              child: const Text('Select from Gallery'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImages(isGallery: false);
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
    return Column(
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _pickedImages.map((image) {
            return Stack(
              children: [
                Image.file(File(image),
                    height: 100, width: 100, fit: BoxFit.cover),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _pickedImages.remove(image);
                      });
                    },
                    child: const Icon(Icons.remove_circle, color: Colors.red),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
        DottedBorder(
          radius: const Radius.circular(20),
          padding: const EdgeInsets.all(20),
          borderType: BorderType.RRect,
          dashPattern: const [10, 10],
          strokeWidth: 2,
          child: GestureDetector(
            onTap: _showImagePickerOptions,
            child: Container(
              height: 100,
              clipBehavior: Clip.hardEdge,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Icon(Icons.add_photo_alternate, size: 50),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
