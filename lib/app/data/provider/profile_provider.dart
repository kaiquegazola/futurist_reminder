import 'package:flutter/material.dart';
import 'package:futuristreminder/app/data/model/profile.dart';
import 'package:get_storage/get_storage.dart';

class ProfileProvider {
  ProfileProvider({@required this.box});

  final GetStorage box;

  Profile getProfile() {
    return Profile.fromJson(box.read('profile'));
  }

  saveProfile(Profile profile) {
    box.write('profile', profile.toJson());
    box.save();
  }
}
