import 'package:futuristreminder/app/controller/profile_rx.dart';

class Profile {
  Profile({String name, String image});

  final rx = ProfileRx();

  String get name => rx.name.value;
  set name(String value) => rx.name.value = value;

  String get image => rx.image.value;
  set image(String value) => rx.image.value = value;

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(name: json['name'], image: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'image': image};
  }
}
