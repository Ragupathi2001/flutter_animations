


import 'package:flutter/material.dart';

class HeartPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 237, 29, 29)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();

    path_0.moveTo(size.width*0.3025000,size.height*0.3978571);
    path_0.quadraticBezierTo(size.width*0.3526083,size.height*0.2905429,size.width*0.4054167,size.height*0.3557143);
    path_0.quadraticBezierTo(size.width*0.4388583,size.height*0.4007143,size.width*0.3941667,size.height*0.5021429);
    path_0.lineTo(size.width*0.2979167,size.height*0.6385714);
    path_0.lineTo(size.width*0.2162500,size.height*0.5007143);
    path_0.quadraticBezierTo(size.width*0.1652083,size.height*0.3832143,size.width*0.2020833,size.height*0.3542857);
    path_0.quadraticBezierTo(size.width*0.2237500,size.height*0.2878571,size.width*0.3025000,size.height*0.3978571);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);


    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path_0, paint_stroke_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}