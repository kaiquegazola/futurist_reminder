import 'package:futuristreminder/app/data/model/place.dart';
import 'package:get/get.dart';

class PlaceRx extends GetxController {
  final id = RxInt();
  final description = RxString();
  final location = RxString();
  Rx<List<Place>> places = Rx<List<Place>>();
}
