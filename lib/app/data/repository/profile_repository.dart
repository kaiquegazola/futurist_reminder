import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:futuristreminder/app/data/model/profile.dart';
import 'package:futuristreminder/app/data/provider/profile_provider.dart';
import 'package:get/get.dart';

class ProfileRepository {
  ProfileRepository({@required this.provider});

  final ProfileProvider provider;

  Future<Profile> getProfile() async {
    return Profile.fromJson(await provider.getProfile());
  }

  saveProfile(Profile profile) {
    return provider.saveProfile(profile.toJson());
  }

  updateImage(List<int> imageBytes) {
    Profile profile = Get.find<Profile>();
    profile.image = base64.encode(imageBytes);
    return provider.saveProfile(profile.toJson());
  }
}
