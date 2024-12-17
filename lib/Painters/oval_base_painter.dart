



import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class OvalBasePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paintFill0 = Paint()
      ..shader = ui.Gradient.linear(
        Offset(size.width* .5, size.height *.1),
        Offset(size.width* .5, size.height *.9),
        [
          const Color.fromRGBO(248, 89, 82, .4),
          const Color.fromRGBO(89, 87, 248, .4),
        ],
      )
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.miter;


    Path path = Path();
    //
    path.moveTo(size.width *.028, size.height *.45);
    path.conicTo(size.width * .4, size.height * 1.28, size.width *.88, size.height *.6,1.63);
    path.quadraticBezierTo(size.width * 1.12  , size.height * .18, size.width *.4, size.height *.02);
    path.quadraticBezierTo(size.width* -.10,0, size.width *.028, size.height *.45);

    canvas.drawPath(path, paintFill0);


    Path path2 = Path();

    path2.moveTo(size.width *.15, size.height *.89);
    path2.quadraticBezierTo(size.width * .4, size.height * 1.0, size.width *.7, size.height *.96);
    path2.quadraticBezierTo(size.width * 1.08, size.height * .85, size.width *.93, size.height *.25);
    path2.quadraticBezierTo(size.width *.78 , size.height * -.15, size.width * .25, size.height *.15);
    path2.quadraticBezierTo(size.width * -.15  , size.height * .510, size.width *.1, size.height *.85);
path.close();

    canvas.drawPath(path2, paintFill0);


    Path path3 = Path();

    path3.moveTo(size.width *.18, size.height *.85);
    path3.quadraticBezierTo(size.width * 0.75, size.height * 1.23, size.width *.98, size.height *.6);
    path3.quadraticBezierTo(size.width *1.15 , size.height * -.25, size.width *.15, size.height *.12);
    path3.quadraticBezierTo(size.width * -.1 , size.height * .35,size.width *.1, size.height *.78);
    path.close();
    // path3.lineTo(size.width, size.height);
    // path3.lineTo(0, size.height);
    // path3.lineTo(0, size.height *.125);


    canvas.drawPath(path3, paintFill0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}