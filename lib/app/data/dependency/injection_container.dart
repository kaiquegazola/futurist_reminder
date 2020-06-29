import 'package:futuristreminder/app/data/dependency/database_provider.dart';
import 'package:futuristreminder/app/data/model/place.dart';
import 'package:futuristreminder/app/data/model/profile.dart';
import 'package:futuristreminder/app/data/provider/place_provider.dart';
import 'package:futuristreminder/app/data/provider/profile_provider.dart';
import 'package:futuristreminder/app/data/repository/place_repository.dart';
import 'package:futuristreminder/app/data/repository/profile_repository.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut<DatabaseProvider>(() => DatabaseProvider());
  Get.lazyPut<ProfileProvider>(() => ProfileProvider(dbProvider: Get.find()));
  Get.lazyPut<ProfileRepository>(() => ProfileRepository(provider: Get.find()));
  Get.lazyPut<PlaceProvider>(() => PlaceProvider(dbProvider: Get.find()));
  Get.lazyPut<PlaceRepository>(() => PlaceRepository(provider: Get.find()));
  Get.put<Profile>(await Get.find<ProfileRepository>().getProfile());
  Place place = Place(places: (await Get.find<PlaceRepository>().getPlaces()));
  Get.put(place);
}
