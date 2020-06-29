import 'package:flutter/material.dart';
import 'package:futuristreminder/app/data/model/place.dart';
import 'package:futuristreminder/app/data/repository/place_repository.dart';
import 'package:futuristreminder/app/ui/widgets/future_item_list.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlacesScreen extends GetView<Place> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          if (controller.places != null) ...[
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                shrinkWrap: true,
                itemCount: controller.places.length,
                itemBuilder: (context, index) {
                  Place place = controller.places[index];
                  return FutureItemList(
                    text: place.description,
                    onPressed: () => Get.snackbar('Hi', 'text'),
                    onLongPress: () {
                      Get.find<PlaceRepository>().remove(place);
                    },
                  );
                },
              ),
            ),
          ] else
            Text("you dont have lembretes"),
        ],
      ),
    );
  }
}
