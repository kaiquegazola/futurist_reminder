import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futuristreminder/app/ui/theme/colors_theme.dart';

class FutureItemList extends StatelessWidget {
  const FutureItemList({
    Key key,
    @required this.index,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  final int index;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      child: Row(
        children: <Widget>[
          if (index != 0)
            Container(height: 90.h, width: 1.w, color: Colors.blue[400]),
          Row(
            children: <Widget>[
              Container(height: 1, width: 20.w, color: Colors.blue[400]),
              ClipPath(
                clipper: Sky(),
                child: RaisedButton(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 60.w),
                    color: ColorsTheme.deepBlue,
                    onPressed: onPressed,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 150.w,
                      child: Text(
                        text.toUpperCase(),
                        style: TextStyle(
                          letterSpacing: 4,
                          fontSize: 24.ssp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
            ],
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
