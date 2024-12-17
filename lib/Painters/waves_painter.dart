
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class WavesPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paintFill0 = Paint()
      ..shader = ui.Gradient.linear(
        Offset(size.width* .1, size.height *.7),
        Offset(size.width* .9, size.height *.7),
        [
          Color.fromRGBO(248, 89, 82, .5),
          Color.fromRGBO(89, 87, 248, .5),
        ],
      )
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path = Path();
    //
    path.moveTo(0, size.height *.25);
    path.quadraticBezierTo(size.width * .3, size.height * -.13, size.width *.5, size.height *.17);
    path.quadraticBezierTo(size.width *.75 , size.height * .58, size.width, size.height *.07);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height *.25);

    canvas.drawPath(path, paintFill0);


    Path path2 = Path();

    path2.moveTo(0, size.height *.145);
    path2.quadraticBezierTo(size.width * .18, size.height * -.08, size.width *.35, size.height *.2);
    path2.quadraticBezierTo(size.width *.5 , size.height * .5, size.width * .7, size.height *.26);
    path2.quadraticBezierTo(size.width *.95 , size.height * -.110, size.width *1.18, size.height *.17);
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.lineTo(0, size.height *.125);


    canvas.drawPath(path2, paintFill0);


    Path path3 = Path();

    path3.moveTo(-size.width *.05, size.height *.03);
    path3.quadraticBezierTo(size.width * .11, size.height * -.03, size.width *.25, size.height *.18);
    path3.quadraticBezierTo(size.width *.45 , size.height * .55, size.width *.65, size.height *.22);
    path3.quadraticBezierTo(size.width *.85 , size.height * -.15, size.width*1.1, size.height *.29);
    path3.lineTo(size.width, size.height);
    path3.lineTo(0, size.height);
    path3.lineTo(0, size.height *.125);


    canvas.drawPath(path3, paintFill0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}