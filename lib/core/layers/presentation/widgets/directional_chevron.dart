import 'package:flutter/material.dart';

/// A directional chevron drawn with [CustomPaint] instead of an icon-font
/// glyph so it can't be affected by icon font caching/mirroring issues —
/// verify with this widget before assuming a directionality bug is a real
/// code issue. By default points in the reading direction (right in LTR,
/// left in RTL, e.g. "go to this item"); pass [pointBackward] for a back
/// button, which points against reading direction (left in LTR, right in
/// RTL).
class DirectionalChevron extends StatelessWidget {
  const DirectionalChevron({
    super.key,
    this.size,
    this.color,
    this.pointBackward = false,
  });

  final double? size;
  final Color? color;
  final bool pointBackward;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final pointsLeft = pointBackward ? !isRtl : isRtl;
    final resolvedSize = size ?? 24;
    final resolvedColor = color ?? IconTheme.of(context).color ?? Colors.black;
    return SizedBox(
      width: resolvedSize,
      height: resolvedSize,
      child: CustomPaint(
        painter: _ChevronPainter(pointLeft: pointsLeft, color: resolvedColor),
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
