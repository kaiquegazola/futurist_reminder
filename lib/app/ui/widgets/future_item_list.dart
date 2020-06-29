import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futuristreminder/app/data/model/place.dart';
import 'package:futuristreminder/app/data/repository/place_repository.dart';
import 'package:futuristreminder/app/ui/theme/colors_theme.dart';
import 'package:get/get.dart';

class FutureItemList extends StatelessWidget {
  const FutureItemList({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.place,
  }) : super(key: key);

  final String text;
  final Function onPressed;
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      child: Row(
        children: <Widget>[
          Container(height: 1, width: 20.w, color: Get.theme.accentColor),
          ClipPath(
            clipper: Sky(),
            child: RaisedButton(
              onLongPress: () {
                Get.find<PlaceRepository>().remove(place);
              },
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 60.w),
              color: ColorsTheme.deepBlue,
              onPressed: onPressed,
              child: Text(
                text.toUpperCase(),
                style: TextStyle(
                  letterSpacing: 4,
                  fontSize: 24.ssp,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Sky extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double h = size.height;
    double w = size.width;

    double xOffset = 0.1;
    Path path = Path()
      ..lineTo(w * xOffset, h)
      ..lineTo(w - w * xOffset, h)
      ..lineTo(w, h / 2)
      ..lineTo(w - w * xOffset, 0)
      ..lineTo(w * xOffset, 0.0)
      ..lineTo(0.0, h / 2)
      ..lineTo(w * xOffset, h);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
