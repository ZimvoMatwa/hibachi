import 'package:flutter/material.dart';

class FadeInSlideUpWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const FadeInSlideUpWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  State<FadeInSlideUpWidget> createState() => _FadeInSlideUpWidgetState();
}

class _FadeInSlideUpWidgetState extends State<FadeInSlideUpWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // TODO(zimvo): make tween editable
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _slideAnimation = Tween<Offset>(
      // TODO(zimvo): make offset editable
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // startAnimation();

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}
