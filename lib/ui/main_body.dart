import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MainBody extends StatefulWidget {
  final Widget child;
  final bool loading;

  const MainBody({this.child, this.loading});

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.purple,
        //Here goes the same radius, u can put into a var or function
        borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 4,
            blurRadius: 14,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment
                  .bottomLeft, // 10% of the width, so there are ten blinds.
              colors: <Color>[
                Color(0xff37436B),
                Color(0xff232B45)
              ], // red to yellow
              // tileMode: TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          child: widget.loading
              ? Shimmer.fromColors(
                  baseColor: Color(0xFF444E74),
                  highlightColor: Color(0xFF5B658D),
                  direction: ShimmerDirection.ttb,
                  enabled: true,
                  child: widget.child,
                )
              : widget.child,
        ),
      ),
    );
  }
}
