

import 'package:flutter/material.dart';

import 'Painters/oval_base_painter.dart';
import 'Painters/waves_painter.dart';

class PracticePaint extends StatefulWidget {
  const PracticePaint({super.key});

  @override
  State<PracticePaint> createState() => _PracticePaintState();
}

class _PracticePaintState extends State<PracticePaint> {

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    return  Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Container(
          color: Colors.white,
          child: InteractiveViewer(
            child: CustomPaint(
              // size: const Size(300,(300*0.5833333333333334)), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              size:  Size(300,300), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: OvalBasePainter(),
            ),
          ),
        ),
      ),
    );
  }
}


