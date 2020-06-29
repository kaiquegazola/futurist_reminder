import 'package:flutter/material.dart';
import 'package:futuristreminder/app/data/model/profile.dart';
import 'package:futuristreminder/app/data/repository/profile_repository.dart';
import 'package:futuristreminder/app/ui/widgets/future_container_bordered.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'dart:convert';

class ProfileWidget extends GetView<Profile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15.h, left: 15.w),
          child: GestureDetector(
            onTap: () => changeImage(),
            child: FutureContainerBordered(
              height: 200.h,
              width: 200.w,
              child: Center(
                child: Obx(
                  () => controller.image == null
                      ? Text(
                          'addImage'.tr,
                          textAlign: TextAlign.center,
                        )
                      : Image.memory(
                          base64.decode(controller.image),
                        ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Center(
                child: Obx(
                  () => Text(
                    controller.name ?? 'Visitor',
                    style: TextStyle(fontSize: 62.ssp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Text('slogan'.tr),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> changeImage() async {
    if ((await Permission.camera.request()).isDenied) {
      Get.defaultDialog(
        textConfirm: "Allow",
        textCancel: "Cancel",
        onConfirm: () async {
          if (await Permission.camera.isPermanentlyDenied) {
            openAppSettings();
          } else {
            await Permission.camera.request();
          }
          Get.back();
          await changeImage();
        },
        middleText:
            "We need to access your camera to select your image profile",
      );
      return;
    }
    return Get.bottomSheet(
      Card(
        child: Wrap(
          runSpacing: 15.h,
          children: <Widget>[
            Center(
              child: ListTile(
                title: Text(
                  "Select your profile image from:",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
                leading: Icon(LineIcons.photo),
                title: Text('Gallery'),
                onTap: () => getImageFromGallery()),
            ListTile(
              leading: Icon(LineIcons.camera),
              title: Text('Camera'),
              onTap: () => getImageFromCamera(),
            ),
          ],
        ),
      ),
    );
  }

  Future getImageFromCamera() async {
    Get.back();
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    _setImage(pickedFile.path);
  }

  Future getImageFromGallery() async {
    Get.back();
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    _setImage(pickedFile.path);
  }

  Future<void> _setImage(String path) async {
    if (path.isNotEmpty) {
      List<int> imageBytes = await File(path).readAsBytes();
      ProfileRepository repository = Get.find();
      repository.updateImage(imageBytes);
    }
  }
}
