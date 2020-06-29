import 'package:futuristreminder/app/controller/helper_rx.dart';

class Helper {
  Helper({id, name, description, helpers}) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.helpers = helpers;
  }

  final rx = HelperRx();

  int get id => rx.id.value;
  set id(int value) => rx.id.value = value;

  String get name => rx.name.value;
  set name(String value) => rx.name.value = value;

  String get description => rx.description.value;
  set description(String value) => rx.description.value = value;

  List<Helper> get helpers => rx.helpers.value;
  set helpers(List<Helper> value) => rx.helpers.value = value;

  factory Helper.fromJson(Map<String, dynamic> json) => Helper(
        id: json['id'],
        name: json['name'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };
}
