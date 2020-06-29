import 'package:get/get.dart';
import 'package:futuristreminder/app/data/model/helper.dart';

class HelperRx extends GetxController {
  final id = RxInt();
  final name = RxString();
  final description = RxString();
  final helpers = Rx<List<Helper>>();
}
