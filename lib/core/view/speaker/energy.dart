import 'dart:math' as math;

import 'package:flutter/material.dart';

class EnergyConsumptionWidget extends StatelessWidget {
  final double currentConsumption; // e.g., 0.45
  final double
  totalPossible; // e.g., representing the full circle if needed, or just a base for calculation
  final double outsideConsumption; // e.g., 0.85

  const EnergyConsumptionWidget({
    super.key,
    required this.currentConsumption,
    required this.totalPossible, // A value that represents the '100%' for the main arc
    required this.outsideConsumption,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 296,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            painter: _EnergyArcPainter(
              currentConsumption: currentConsumption,
              totalPossible: totalPossible,
            ),
            size: const Size(double.infinity, double.infinity),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: currentConsumption.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: const [
                    TextSpan(
                      text: 'kWh',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${outsideConsumption.toStringAsFixed(2)}Kwh outside',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EnergyArcPainter extends CustomPainter {
  final double currentConsumption;
  final double totalPossible;

  _EnergyArcPainter({
    required this.currentConsumption,
    required this.totalPossible,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - 5;

    final backgroundPaint = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 45
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final innerCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final dotPaint = Paint()
      ..color = Colors
          .black // Dot color
      ..style = PaintingStyle.fill;

    // Draw the full background circle/arc (we'll make it partially visible later if needed)
    // For this design, it looks like a full circle with an 'empty' gap
    // Let's assume the arc covers 300 degrees out of 360, leaving a gap.
    const double startAngleOffset =
        -math.pi / 2; // Start from the top (12 o'clock)
    const double totalArcSweep =
        2 * math.pi * 0.85; // Represents roughly 300 degrees (360 * 0.85)

    // Draw the outer background arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngleOffset + math.pi * 0.1,
      totalArcSweep,
      false,
      backgroundPaint,
    );

    // Calculate progress sweep angle
    double progressRatio = currentConsumption / totalPossible;
    // Cap the progress ratio to 1.0 to avoid drawing beyond the full circle
    if (progressRatio > 1.0) progressRatio = 1.0;

    // The progress arc in the design appears to be connected to the 'inside' part
    // Let's assume the progress is shown on a segment of the background arc.
    // The design has a specific appearance, let's try to mimic that.
    // The progress arc starts from the bottom left and goes up to the top right.

    // A simpler approach for the given design might be two separate arcs.
    // The outer light gray one is like a background.
    // The inner darker one is the "progress"
    final double innerRadius = radius * 0.7; // Inner circle radius

    // Draw inner circle stroke
    canvas.drawCircle(
      center,
      innerRadius + innerCirclePaint.strokeWidth / 2,
      innerCirclePaint,
    );

    // The inner progress bar, let's define its start and end angles
    // Based on the image, the 'progress' part (darker grey) spans from roughly
    // 7 o'clock to 1 o'clock, with a specific "current" value shown.
    // We'll treat the darker arc as a fixed-length arc for the "inner value" (0.45 kWh)
    // and its end point marks the 'current consumption'.

    // Let's redefine the arcs to match the visual.
    // The main large arc seems to be a fixed partial circle.
    // The inner arc seems to be the one showing "progress"

    // Outer light gray arc
    final double outerArcStartAngle = math.pi * 0.75; // Roughly 7 o'clock
    final double outerArcSweepAngle =
        math.pi * 1.5; // Goes up to roughly 1 o'clock
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      outerArcStartAngle,
      outerArcSweepAngle,
      false,
      backgroundPaint,
    );

    // Inner darker progress arc
    final double innerArcRadius =
        innerRadius +
        backgroundPaint.strokeWidth / 2 -
        5; // A bit outside the black circle
    final double innerProgressSweepAngle =
        (currentConsumption / totalPossible) *
        outerArcSweepAngle; // Scale progress
    // Ensure the inner progress arc's start angle is aligned with the outer arc's perceived start.
    final double innerArcStartAngle = outerArcStartAngle;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerArcRadius),
      innerArcStartAngle,
      innerProgressSweepAngle,
      false,
      progressPaint,
    );

    // Draw dots
    // Dot on the outer arc (top right end)
    final double outerDotAngle = outerArcStartAngle + outerArcSweepAngle;
    Offset outerDotPosition = Offset(
      center.dx + radius * math.cos(outerDotAngle),
      center.dy + radius * math.sin(outerDotAngle),
    );
    canvas.drawCircle(outerDotPosition, 5, dotPaint); // Size 5 for the dot

    // Dot on the inner progress arc (at its end point)
    final double innerDotAngle = innerArcStartAngle + innerProgressSweepAngle;
    Offset innerDotPosition = Offset(
      center.dx + innerArcRadius * math.cos(innerDotAngle),
      center.dy + innerArcRadius * math.sin(innerDotAngle),
    );
    canvas.drawCircle(innerDotPosition, 5, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Only repaint if consumption values change
    return (oldDelegate as _EnergyArcPainter).currentConsumption !=
            currentConsumption ||
        oldDelegate.totalPossible != totalPossible;
  }
}
