import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class StarShapePainter extends CustomPainter {
  final double value;

  StarShapePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, 0);
    path_0.lineTo(size.width * 0.6122556, size.height * 0.3454917);
    path_0.lineTo(size.width * 0.9755278, size.height * 0.3454917);
    path_0.lineTo(size.width * 0.6816333, size.height * 0.5590167);
    path_0.lineTo(size.width * 0.7938944, size.height * 0.9045111);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.6909833);
    path_0.lineTo(size.width * 0.2061072, size.height * 0.9045111);
    path_0.lineTo(size.width * 0.3183644, size.height * 0.5590167);
    path_0.lineTo(size.width * 0.02447178, size.height * 0.3454917);
    path_0.lineTo(size.width * 0.3877428, size.height * 0.3454917);
    path_0.lineTo(size.width * 0.5000000, 0);
    path_0.close();

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.shader = ui.Gradient.linear(
      const ui.Offset(0, 0),
      ui.Offset(size.width, 0),
      [const Color(0xFFFFB800), const Color(0xFFFFB800), Colors.white],
      [0.0, value, value],
      ui.TileMode.clamp

    );
    canvas.drawPath(path_0, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
