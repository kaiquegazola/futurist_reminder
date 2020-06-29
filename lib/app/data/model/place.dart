import 'package:futuristreminder/app/controller/place_rx.dart';

class Place {
  Place({int id, String description, String location, List<Place> places}) {
    this.id = id;
    this.description = description;
    this.location = location;
    this.places = places;
  }

  final rx = PlaceRx();

  int get id => rx.id.value;
  set id(int value) => rx.id.value = value;

  String get description => rx.description.value;
  set description(String value) => rx.description.value = value;

  String get location => rx.location.value;
  set location(String value) => rx.location.value = value;

  List<Place> get places => rx.places.value;
  set places(List<Place> value) => rx.places.value = value;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json['id'],
        description: json['description'],
        location: json['location'],
      );

  Map<String, dynamic> toJson() =>
      {'id': id, 'description': description, 'location': location};
}
