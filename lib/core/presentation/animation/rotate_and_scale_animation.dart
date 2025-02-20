import 'package:art_list/core/presentation/animation/rotation_animation.dart';
import 'package:art_list/core/presentation/animation/scale_animation.dart';
import 'package:flutter/material.dart';

class RotateAndScaleAnimation extends StatelessWidget {
  final Duration duration;
  final Curve curve;
  final Widget child;

  const RotateAndScaleAnimation({
    super.key,
    required this.duration,
    required this.curve,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RotationAnimation(
      duration: duration,
      curve: curve,
      child: ScaleAnimation(
        duration: duration,
        curve: curve,
        child: child,
      ),
    );
  }
}
