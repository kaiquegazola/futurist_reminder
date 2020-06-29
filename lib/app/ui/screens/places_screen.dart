import 'package:flutter/material.dart';
import 'package:futuristreminder/app/ui/widgets/future_item_list.dart';
import 'package:get/get.dart';

class PlacesScreen extends StatefulWidget {
  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  var items = ['Casa', 'Trabalho', 'Mercado'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          child: RaisedButton(
            onPressed: () {},
            child: Text("addPlace".tr),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return FutureItemList(
              index: index,
              text: items[index],
              onPressed: () => Get.snackbar('Hi', 'text'),
            );
          },
        ),
      ],
    );
  }
}
