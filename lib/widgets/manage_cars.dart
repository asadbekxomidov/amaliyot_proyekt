import 'dart:io';

import 'package:amaliyot_proyekt/controllers/cars_controller.dart';
import 'package:amaliyot_proyekt/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ManageCars extends StatefulWidget {
  const ManageCars({super.key});

  @override
  State<ManageCars> createState() => _ManageCarsState();
}

class _ManageCarsState extends State<ManageCars> {
  final nameController = TextEditingController();
  File? imageFile;

  void addCar() async {
    Messages.showLoadingDialog(context);
    await context.read<CarsController>().addCar(
          nameController.text,
          imageFile!,
        );

    if (context.mounted) {
      nameController.clear();
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  void openGallery() async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      requestFullMetadata: false,
    );

    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
      });
    }
  }

  void openCamera() async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      requestFullMetadata: false,
    );

    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Rasm Qo'shish"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Rasm nomi",
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Rasm Qo'shish",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: openCamera,
                label: const Text("Kamera"),
                icon: const Icon(Icons.camera, size: 20),
              ),
              TextButton.icon(
                onPressed: openGallery,
                label: const Text("Galleriya"),
                icon: const Icon(Icons.image, size: 20),
              ),
            ],
          ),
          if (imageFile != null)
            SizedBox(
              height: 200,
              child: Image.file(
                imageFile!,
                fit: BoxFit.cover,
              ),
            )
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(fontSize: 16),
              ),
            ),
            FilledButton(
              onPressed: addCar,
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
