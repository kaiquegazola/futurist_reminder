import 'dart:math';

import 'package:flutter/material.dart';
import 'package:futuristreminder/app/ui/theme/colors_theme.dart';

class FutureContainerBordered extends StatelessWidget {
  const FutureContainerBordered({
    Key key,
    this.borderPrimaryColor = ColorsTheme.orange,
    this.borderSecundaryColor = ColorsTheme.lightBlue,
    @required this.width,
    @required this.height,
    @required this.child,
  }) : super(key: key);

  final Color borderPrimaryColor;
  final Color borderSecundaryColor;
  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var borderCornor = min(width, height) * 0.2;
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned.fill(child: child),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue[400]),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: borderCornor,
              height: borderCornor,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 2.0, color: Colors.orange[900]),
                  left: BorderSide(width: 2.0, color: Colors.orange[900]),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: borderCornor,
              height: borderCornor,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 2.0, color: Colors.orange[900]),
                  right: BorderSide(width: 2.0, color: Colors.orange[900]),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: borderCornor,
              height: borderCornor,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(width: 2.0, color: Colors.orange[900]),
                  bottom: BorderSide(width: 2.0, color: Colors.orange[900]),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: borderCornor,
              height: borderCornor,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(width: 2.0, color: Colors.orange[900]),
                  bottom: BorderSide(width: 2.0, color: Colors.orange[900]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
