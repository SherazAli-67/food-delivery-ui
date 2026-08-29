import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui/core/app_icons.dart';

class CircularProgressButton extends StatefulWidget {
  final Duration duration;
  final VoidCallback? onCompleted;
  final bool repeat;

  const CircularProgressButton({
    super.key,
    this.duration = const Duration(seconds: 3),
    this.onCompleted,
    this.repeat = false,
  });

  @override
  State<CircularProgressButton> createState() =>
      _CircularProgressButtonState();
}

class _CircularProgressButtonState extends State<CircularProgressButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onCompleted?.call();

        if (widget.repeat) {
          _controller.reset();
          _controller.forward();
        }
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(94, 94),
          painter: _CircularProgressPainter(
            progress: _controller.value,
          ),
          child: const SizedBox(
            width: 94,
            height: 94,
            child: Center(
              child: _ArrowButton(),
            ),
          ),
        );
      },
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF8F9FA),
        shape: BoxShape.circle,
      ),
      padding: .all(20),
      child: SvgPicture.asset(AppIcons.icArrowNext, height: 24, width: 24,),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress;

  _CircularProgressPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius = size.width / 2 -4;

    // Background track
    final backgroundPaint = Paint()
      ..color = const Color(0xFF343A4B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(
      center,
      radius,
      backgroundPaint,
    );

    // Animated progress
    final progressPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    // Start from the top (-90 degrees)
    const startAngle = -math.pi / 2;

    final sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}