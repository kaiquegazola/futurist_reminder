import 'package:flutter/material.dart';
import 'package:futuristreminder/app/data/model/place.dart';
import 'package:futuristreminder/app/data/repository/place_repository.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceAddWidget extends GetView<Place> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 30.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Salvar novo Local'),
            SizedBox(height: 20),
            Obx(
              () => TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'description'.tr,
                  contentPadding: EdgeInsets.all(35.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onChanged: (t) => controller.description = t,
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('save'.tr),
              onPressed: () {
                Get.back();
                PlaceRepository repository = Get.find();
                repository.save(controller);
                //     Geolocator()
                // .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
              },
            ),
          ],
        ),
      ),
    );
  }
}
