import 'package:flutter/material.dart';

/// A "forward" chevron that points in the reading direction: right in LTR,
/// left in RTL. Drawn with [CustomPaint] instead of an icon-font glyph so it
/// can't be affected by icon font caching/tree-shaking issues — verify with
/// this widget before assuming a directionality bug is a real code issue.
class DirectionalChevron extends StatelessWidget {
  const DirectionalChevron({super.key, this.size, this.color});

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final resolvedSize = size ?? 24;
    final resolvedColor = color ?? IconTheme.of(context).color ?? Colors.black;
    return SizedBox(
      width: resolvedSize,
      height: resolvedSize,
      child: CustomPaint(
        painter: _ChevronPainter(pointLeft: isRtl, color: resolvedColor),
      ),
    );
  }
}

class _ChevronPainter extends CustomPainter {
  _ChevronPainter({required this.pointLeft, required this.color});

  final bool pointLeft;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.width * 0.14
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final midY = size.height / 2;
    final horizontalInset = size.width * 0.38;
    final verticalInset = size.height * 0.32;
    final tipX = pointLeft ? horizontalInset : size.width - horizontalInset;
    final backX = pointLeft ? size.width - horizontalInset : horizontalInset;

    final path = Path()
      ..moveTo(backX, verticalInset)
      ..lineTo(tipX, midY)
      ..lineTo(backX, size.height - verticalInset);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _ChevronPainter oldDelegate) =>
      oldDelegate.pointLeft != pointLeft || oldDelegate.color != color;
}
