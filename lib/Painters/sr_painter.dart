



import 'dart:ui';

import 'package:flutter/material.dart';

class SRPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..imageFilter = ImageFilter.blur()
      ..strokeJoin = StrokeJoin.miter;

    double radius=20;
    Path path = Path()
      ..moveTo(size.width*.5 , size.height*.19)
      ..lineTo(size.width*.2, size.height*.19)
      ..arcToPoint(Offset(size.width*.2, size.height*.47), radius: Radius.circular(radius),clockwise: false,)
      ..lineTo(size.width*.4, size.height*.47)
      ..arcToPoint(Offset(size.width*.4, size.height*.9), radius: Radius.circular(radius),)
      ..lineTo(size.width*.07, size.height*.9)
      ..lineTo(size.width*.07, size.height*.82)
      ..lineTo(size.width*.4, size.height*.82)
      ..arcToPoint(Offset(size.width*.4, size.height*.55), radius: Radius.circular(radius),clockwise: false)
      ..lineTo(size.width*.2, size.height*.55)
      ..arcToPoint(Offset(size.width*.2, size.height*.1), radius: Radius.circular(radius),)
      ..lineTo(size.width*.5, size.height*.1)
      ..lineTo(size.width*.5, size.height*.19)
      ..relativeMoveTo(20, -(size.height*.1))
      ..relativeLineTo(0, size.height*.8)
      ..relativeLineTo(size.width*.09, 0)
      ..lineTo(size.width*.65, size.height*.6)
      ..lineTo(size.width*.78, size.height*.9)
      ..relativeLineTo(size.width*.13, 0)
      ..relativeLineTo(-(size.width*.13), -(size.height*.3))
      ..relativeLineTo(5, 0)
      ..arcToPoint(Offset( size.width * .78, size.height*.1), radius: Radius.circular(radius),clockwise: false)
    // ..conicTo(size.width *1.05 , size.height * .35,   size.width * .78,size.height* .1, 1 )
      ..lineTo(size.width * .567 ,size.height* .09  )
      ..relativeLineTo(size.width* .07 ,0 )
      ..relativeMoveTo(0 ,size.height* .13 )
      ..addRRect(RRect.fromLTRBAndCorners(size.width* .65  ,size.height* .23  , size.width* .85,size.height* .45 , topRight: Radius.circular(30),bottomRight: Radius.circular(30)))
    // ..relativeLineTo(0,-(size.height*.8) )
    // ..relativeLineTo(40,0 )
    // ..arcToPoint(Offset(size.width, radius), radius: Radius.circular(radius))
    //   ..lineTo(size.width, size.height)
    // ..relativeLineTo(-150, -40)
    // ..arcToPoint(Offset(size.width - radius, size.height), radius: Radius.circular(radius))
    // ..lineTo(size.width / 3, size.height)
    // ..quadraticBezierTo(size.width / 4, size.height, 40, (size.height / 2))
    // ..quadraticBezierTo(40, (size.height / 2) - 30, size.width / 2, 0)
    // ..close();
        ;
    canvas.drawPath(path, paintFill0);




    // Layer 2

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path, paint_stroke_0);


    // Layer 3

    Paint paint_fill_1 = Paint()
      ..color = const Color.fromARGB(25, 55, 55, 225)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_1 = Path();
    path_1.moveTo(size.width*0.3891667,size.height*0.5900000);

    canvas.drawPath(path, paint_fill_1);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}