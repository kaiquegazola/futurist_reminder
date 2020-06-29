import 'package:flutter/material.dart';
import 'package:futuristreminder/app/ui/widgets/future_item_list.dart';
import 'package:get/get.dart';
import 'package:futuristreminder/app/data/model/helper.dart';
import 'package:futuristreminder/app/data/repository/helper_repository.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpersScreen extends GetView<Helper> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          if (controller.helpers != null) ...[
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                shrinkWrap: true,
                itemCount: controller.helpers.length,
                itemBuilder: (context, index) {
                  Helper helper = controller.helpers[index];
                  return FutureItemList(
                    text: helper.name,
                    onPressed: () => Get.snackbar('Hi', 'text'),
                    onLongPress: () {
                      Get.find<HelperRepository>().remove(helper);
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
