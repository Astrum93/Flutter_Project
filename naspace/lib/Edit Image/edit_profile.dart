import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileImage extends StatefulWidget {
  const EditProfileImage({super.key});

  @override
  State<EditProfileImage> createState() => _nameState();
}

class _nameState extends State<EditProfileImage> {
  // Image 저장 변수
  File? pickedImage;

  // Image Picker
  void _pickerImage() async {
    final imagePicker = ImagePicker();
    final pickedImageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
      maxHeight: 300,
    );
    setState(() {
      if (pickedImageFile != null) {
        pickedImage = File(pickedImageFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: 150,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          const Text(
            '프로필 이미지 변경',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          // 프로필 이미지
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            backgroundImage:
                pickedImage != null ? FileImage(pickedImage!) : null,
          ),
          const SizedBox(height: 2),
          // 업로드 버튼
          TextButton(
            onPressed: () {
              _pickerImage();
            },
            child: const Text(
              'Upload',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          // 닫기 버튼
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
            label: const Text(
              'Close',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
