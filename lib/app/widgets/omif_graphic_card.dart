import 'package:flutter/material.dart';

class OMIFGraphicCard extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    canvas.clipRRect(RRect.fromLTRBAndCorners(
      0.0,
      0.0,
      size.width,
      size.height,
      bottomLeft: const Radius.circular(8.0),
      bottomRight: const Radius.circular(8.0),
      topLeft: const Radius.circular(8.0),
      topRight: const Radius.circular(8.0),
    ));
    canvas.drawRRect(
      RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, size.width, size.height)),
      paint0Fill,
    );

    // Grey Triangle
    final path_1 = Path()
      ..moveTo(0, 4)
      ..lineTo(0, 80)
      ..lineTo(0, 75)
      ..lineTo(325, 0)
      ..lineTo(0, 0)
      ..close();

    final paint1Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xffF4F4F4).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);
    final path3 = Path()
      ..moveTo(167.172, 180.358)
      ..cubicTo(
          220.0, 180.358, 270.0, 122.372, 270.0, 50.8433)
      ..cubicTo(270.0, -20.6859, 220.0 + 10.0, -78.6717, 167.172,
          -78.6717)
      ..cubicTo(104.344 + 10.0, -78.6717, 54.344 + 10.0, -20.6859,
          54.344 + 10.0, 50.8433)
      ..cubicTo(54.344 + 10.0, 122.372, 104.344 + 10.0, 180.358, 157.172 + 10.0,
          180.358)
      ..close();

    final paint3Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white.withOpacity(0.25);
    canvas.drawPath(path3, paint3Fill);

    // Budha Gold Circle
    final path2 = Path()
      ..moveTo(183.8, 62.9999)
      ..cubicTo(246.289, 62.9999, 301, 20.1895, 301, -32.61996)
      ..cubicTo(301, -85.4294, 246.289, -128.2399, 178.8, -128.2399)
      ..cubicTo(111.31, -128.2399, 56.5995, -85.4294, 56.5995, -32.61996)
      ..cubicTo(56.5995, 20.1895, 111.31, 62.9999, 178.8, 62.9999)
      ..close();

    final paint2Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0XFFFFF7EA).withOpacity(1.0);

    canvas.drawPath(path2, paint2Fill);

    final path4 = Path()
      ..moveTo(199.136 - 20, 54.395 - 15.0)
      ..cubicTo(256.826 - 20, 54.395 - 15.0, 303.592 - 20, 4.52557 - 15.0,
          303.592 - 20, -56.9915 - 15.0)
      ..cubicTo(303.592 - 20, -118.509 - 15.0, 256.826 - 20, -168.378 - 15.0,
          199.136 - 20, -168.378 - 15.0)
      ..cubicTo(141.447 - 20, -168.378 - 15.0, 94.6801 - 20, -118.509 - 15.0,
          94.6801 - 20, -56.9915 - 15.0)
      ..cubicTo(94.6801 - 20, 4.52557 - 15.0, 141.447 - 20, 54.395 - 15.0,
          199.136 - 20, 54.395 - 15.0)
      ..close();

    final paint4Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white.withOpacity(0.5);
    canvas.drawPath(path4, paint4Fill);

    Path path5 = Path()
      ..moveTo(315.299, 240.507)
      ..cubicTo(362.795, 240.507, 401.299, 202.719, 401.299, 156.104)
      ..cubicTo(401.299, 109.49, 362.795, 71.7015, 315.299, 71.7015)
      ..cubicTo(267.802, 71.7015, 229.299, 109.49, 229.299, 156.104)
      ..cubicTo(229.299, 202.719, 267.802, 240.507, 315.299, 240.507)
      ..close();

    const offsetY = -10.0;
    final translateMatrix = Matrix4.translationValues(0.0, offsetY, 0.0);
    path5 = path5.transform(translateMatrix.storage);

    const offsetX = 20.0;
    final translateRightMatrix = Matrix4.translationValues(offsetX, 0.0, 0.0);
    path5 = path5.transform(translateRightMatrix.storage);
    final paint5fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFEFF6FF).withOpacity(1.0);
    canvas.drawPath(path5, paint5fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
