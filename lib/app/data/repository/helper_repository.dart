import 'package:flutter/material.dart';
import 'package:futuristreminder/app/data/model/helper.dart';
import 'package:futuristreminder/app/data/provider/helper_provider.dart';
import 'package:get/get.dart';

class HelperRepository {
  HelperRepository({@required this.provider});

  final HelperProvider provider;

  Future<List<Helper>> getHelpers() async {
    final result = await provider.getHelpers();
    if (result == null) return List();
    return result.map((e) => Helper.fromJson(e)).toList();
  }

  Future<bool> save(Helper helper) async {
    final bool result = await provider.saveHelper(helper.toJson());
    helper.helpers = await getHelpers();
    return result;
  }

  Future<bool> remove(Helper helper) async {
    final bool result = await provider.remove(helper.id);
    Get.find<Helper>().helpers = await getHelpers();
    return result;
  }
}
