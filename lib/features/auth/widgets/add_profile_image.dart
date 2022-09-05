import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:puja_ltd/common/widgets/horizontal_space.dart';

class AddProfileImage extends StatefulWidget {
  const AddProfileImage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddProfileImage> createState() => _AddProfileImageState();
}

class _AddProfileImageState extends State<AddProfileImage> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        imageFile == null
            ? Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey,
                ),
                child: const Center(
                  child: Icon(Icons.add_a_photo),
                ),
              )
            : Image.file(imageFile!),
        const HorizontalSpace(width: 5),
        TextButton(
          onPressed: () {
            pickImage();
          },
          child: const Text("Add a profile image"),
        )
      ],
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final temp = File(image.path);
      setState(() {
        imageFile = temp;
      });
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}
