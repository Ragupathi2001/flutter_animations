


import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RadialAnime extends StatelessWidget {
  const RadialAnime({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Tween and Transform Animation'),
        // centerTitle: true,
      ),
        body: SizedBox.expand(child: RadialMenu())
    );
  }
}


// The stateful widget + animation controller
class RadialMenu extends StatefulWidget {
  @override
  createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu> with SingleTickerProviderStateMixin {

  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 900), vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller!);
  }

}


// The Animation
class RadialAnimation extends StatefulWidget {
  RadialAnimation({super.key, required this.controller }) :

        scale = Tween<double>(
          begin: 1.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Curves.fastOutSlowIn
          ),
        ),
        angl = Tween<double>(
          begin: 0,
          end:180.0,
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Curves.linear
          ),
        ),

        translation = Tween<double>(
          begin: 0.0,
          end:  50.0,
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Curves.linearToEaseOut
          ),
        );


  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> angl;
  final Animation<double> translation;

  @override
  State<RadialAnimation> createState() => _RadialAnimationState();
}

class _RadialAnimationState extends State<RadialAnimation> {
  Color? bgColor;

  @override
  build(context) {
    return Container(
      color: bgColor?.withOpacity(.6),
      child: Container(
        // margin: EdgeInsets.all(42),

        // alignment: Alignment.bottomRight ,
        child: AnimatedBuilder(
            animation: widget.controller,
            builder: (context, builder) {
              return Stack(
                fit: StackFit.loose,
                  alignment: Alignment.bottomRight,
                  children: [
                    _buildButton(13, color: Colors.red, icon: FontAwesomeIcons.thumbtack),
                    _buildButton(45, color: Colors.green, icon:FontAwesomeIcons.sprayCan),
                    _buildButton(75, color: Colors.orange, icon: FontAwesomeIcons.fire),
                    _buildButton(105, color: Colors.blue, icon:FontAwesomeIcons.kiwiBird),
                    // _buildButton(180, color: Colors.black, icon:FontAwesomeIcons.cat),
                    // _buildButton(225, color: Colors.indigo, icon:FontAwesomeIcons.paw),
                    // _buildButton(270, color: Colors.pink, icon: FontAwesomeIcons.bong),
                    _buildButton(345, color: Colors.yellow, icon:FontAwesomeIcons.bolt),

                    Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: Transform.scale(
                        scale: widget.scale.value - 1.5, // subtract the beginning value to run the opposite animation
                        child: FloatingActionButton(
                            onPressed: _close,
                            backgroundColor: Colors.red,
                            child: const Icon(FontAwesomeIcons.circleXmark)
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: Transform.scale(
                        scale: widget.scale.value,
                        child: FloatingActionButton(
                            onPressed: _open,
                            child:
                            const Icon(FontAwesomeIcons.solidCircleDot)
                        ),
                      ),
                    )

                  ]);
            }),
      ),
    );
  }

  _buildButton(double angle, { required Color color, required IconData icon }) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()..translate(
            (widget.translation.value) * cos(rad) ,
            (widget.translation.value) * sin(rad),
        )

          ..translate(
          (widget.angl.value) * cos(radians(angle + widget.angl.value)) ,
          (widget.angl.value) * sin(radians(angle + widget.angl.value)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: FloatingActionButton(

              backgroundColor: color,
              onPressed: (){
                setState(() {
                  bgColor = color;
                  print(bgColor.toString());
                });
                widget.controller.reverse();
          }, elevation: 5,
              child: Icon(icon)),
        )
    );
  }

  _open() {
    widget.controller.forward();
  }

  _close() {
    widget.controller.reverse();
  }
}

