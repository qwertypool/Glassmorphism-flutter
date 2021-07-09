
//This is the generalised implementation of glassmorphism -->>
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// Usage:
/// ```
/// GlassBox(
///  width: 140,
///  height: 120,
///  shadow: BoxShadow(
///    color: Colors.black26,
///    blurRadius: 12,
///    offset: Offset(0, 14),
///  ),
///  blurRadius: 8,
///  backgroundColor: Colors.white.withOpacity(.2),
///  cornerRadius: 10,
///  child: Center(
///    child: Text(
///      "Hello!",
///      style: TextStyle(
///        fontWeight: FontWeight.bold,
///        fontSize: 24,
///        color: Colors.white,
///      ),
///    ),
///  ),
///),
/// ```
class GlassBox extends StatelessWidget {
  final double blurRadius, cornerRadius, width, height;
  final Border outline;
  final BoxShadow shadow;
  final Color backgroundColor;
  //final Widget child;

  const GlassBox({
    Key? key,
    this.width = 100,
    this.height = 100,
    this.blurRadius = 4.0,
    this.cornerRadius = 10,
    //required this.child,
    required this.outline,
    required this.shadow,
    this.backgroundColor = const Color(0x44ffffff),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double blurSigma = blurRadius * 0.57735 + 0.5;
    final borderRadius = BorderRadius.circular(cornerRadius);

    return Container(
      width: 100,
      height: 300,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipPath(
            clipper: _InvRRectClipper(cornerRadius),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                boxShadow: [
                  // ignore: unnecessary_null_comparison
                  if (shadow != null) shadow,
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: borderRadius),
            clipBehavior: Clip.antiAlias,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
                child: Container(
                  width: 200,
                  height: 300,
                  color: Colors.amber, child: Column(
                  children: [
                    Text('Hey'),
                    SizedBox(height: 10,),
                    Text('Liked it?'),

                  ],
                )),
              ),
            ),
          ),
          Container(
            foregroundDecoration:
                BoxDecoration(border: outline, borderRadius: borderRadius),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius,
            ),
          ),
        ],
      ),
    );
  }
}

class _InvRRectClipper extends CustomClipper<Path> {
  final double radius;

  _InvRRectClipper([this.radius = 12]);

  @override
  Path getClip(Size size) {
    final p = Path()
      ..addRRect(RRect.fromLTRBR(
        0,
        0,
        size.width,
        size.height,
        Radius.circular(radius),
      ))
      ..addRect(Rect.largest)
      ..fillType = PathFillType.evenOdd;
    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}