import 'package:flutter/material.dart';
import 'package:futuristreminder/app/data/model/place.dart';
import 'package:futuristreminder/app/data/provider/place_provider.dart';
import 'package:get/get.dart';

class PlaceRepository {
  PlaceRepository({@required this.provider});

  final PlaceProvider provider;

  Future<List<Place>> getPlaces() async {
    final result = await provider.getPlaces();
    if (result == null) return List();
    return result.map((e) => Place.fromJson(e)).toList();
  }

  Future<bool> save(Place place) async {
    final bool result = await provider.savePlaces(place.toJson());
    place.places = await getPlaces();
    return result;
  }

  Future<bool> remove(Place place) async {
    final bool result = await provider.remove(place.id);
    Get.find<Place>().places = await getPlaces();
    return result;
  }
}
