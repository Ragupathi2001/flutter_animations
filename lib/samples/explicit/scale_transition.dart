import 'package:flutter/material.dart';
import 'package:practice_project/gallery_navigation/page_scaffold.dart';

import '../../animation_controller_state.dart';


class ScaleTransitionPage extends StatefulWidget {
  const ScaleTransitionPage({Key? key}) : super(key: key);

  @override
  State<ScaleTransitionPage> createState() =>
      _ScaleTransitionPageState(const Duration(milliseconds: 1000));
}

class _ScaleTransitionPageState
    extends AnimationControllerState<ScaleTransitionPage> {
  _ScaleTransitionPageState(Duration duration) : super(duration);

  late final _scaleAnimation = Tween(
    begin: 0.0,
    end: 1.0,
  ).animate(CurvedAnimation(
    parent: animationController,
    curve: Curves.easeInOut,
  ));

  @override
  void initState() {
    super.initState();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'ScaleTransition',
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: 180,
            height: 180,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
