import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:simple_fontellico_progress_dialog/fontelico_icons.dart';

class LoadingIndicatorWidget extends StatefulWidget {
  final Color color;
  final String msg;
  final Color msgColor;
  const LoadingIndicatorWidget({
    Key? key,
    required this.msg,
    required this.msgColor,
    required this.color,
  }) : super(key: key);

  @override
  _LoadingIndicatorWidgetState createState() => _LoadingIndicatorWidgetState();
}

class _LoadingIndicatorWidgetState extends State<LoadingIndicatorWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * math.pi,
                child: child,
              );
            },
            child: Icon(
              Fontelico.threelines,
              color: widget.color,
              size: 40.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            '${widget.msg}...',
            style: TextStyle(
              fontSize: 14,
              color: widget.msgColor,
            ),
          ),
        ],
      ),
    );
  }
}
