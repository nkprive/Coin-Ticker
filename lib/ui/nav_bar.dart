import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment
              .bottomRight, // 10% of the width, so there are ten blinds.
          colors: <Color>[
            Color(0xff222B45),
            Color(0xff07090F)
          ], // red to yellow
          // tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: CustomPaint(
        painter: NavbarPainter(),
        child: Container(
          padding: EdgeInsets.only(top: 35.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  // child:
                  // Icon(
                  //   Icons.bar_chart,
                  //   color: Colors.white,
                  //   size: 36.0,
                  // ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Center(
                  child: Text(
                    'Coin Ticker',
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavbarPainter extends CustomPainter {
  final height;
  NavbarPainter({this.height});

  @override
  void paint(Canvas canvas, Size size) {
    final gradient = new ui.Gradient.linear(Offset(-2.0, 0.0),
        Offset(2.0, size.height), [Color(0xff222B45), Color(0xff07090F)]
        // colorStops,
        );
    final gradientPaint = new Paint()..shader = gradient;

    final painter = Paint()
      ..style = PaintingStyle.fill
      ..shader = gradient;

    final path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(0.0, size.height + 60);
    path.arcToPoint(
      Offset(60, size.height),
      radius: Radius.circular(60),
      clockwise: true,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    // path.arcToPoint(
    //   Offset(size.width * 0.8, size.height * 0.6),
    //   radius: Radius.circular(200),
    //   clockwise: false,
    // );

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
