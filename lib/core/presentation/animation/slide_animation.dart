import 'package:flutter/material.dart';

class ArtSlideAnimation extends StatefulWidget {
  final Duration duration;
  final Curve curve;
  final Widget child;

  const ArtSlideAnimation({
    super.key,
    required this.duration,
    required this.curve,
    required this.child,
  });

  @override
  State<ArtSlideAnimation> createState() => _ArtSlideAnimationState();
}

class _ArtSlideAnimationState extends State<ArtSlideAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
