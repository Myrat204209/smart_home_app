import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ThermostatPage extends StatefulWidget {
  const ThermostatPage({super.key});

  @override
  _ThermostatPageState createState() => _ThermostatPageState();
}

class _ThermostatPageState extends State<ThermostatPage> {
  double _temperature = 28.0;
  final double _minTemperature = 16.0;
  final double _maxTemperature = 30.0;

  void _updateTemperature(Offset localPosition, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final angle = math.atan2(
      localPosition.dy - center.dy,
      localPosition.dx - center.dx,
    );

    // Convert angle to temperature
    double normalizedAngle = (angle + math.pi / 2) / (2 * math.pi);
    if (normalizedAngle < 0) normalizedAngle += 1;

    final newTemperature =
        _minTemperature +
        (normalizedAngle * (_maxTemperature - _minTemperature));

    setState(() {
      _temperature = newTemperature.clamp(_minTemperature, _maxTemperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title Text
            Text(
              'Temperature',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ),

            // Core Temperature Gauge & Display
            GestureDetector(
              onPanUpdate: (details) {
                _updateTemperature(details.localPosition, const Size(300, 300));
              },
              child: SizedBox(
                width: 300,
                height: 300,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Custom Circular Gauge
                    CustomPaint(
                      size: const Size(300, 300),
                      painter: TemperatureGaugePainter(
                        temperature: _temperature,
                        minTemperature: _minTemperature,
                        maxTemperature: _maxTemperature,
                      ),
                    ),
                    // Central Temperature Value
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: _temperature.round().toString(),
                            style: TextStyle(
                              fontSize: 90.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[800],
                            ),
                          ),
                          TextSpan(
                            text: '°',
                            style: TextStyle(
                              fontSize: 90.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[800],
                              fontFeatures: [FontFeature.superscripts()],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Section
            Column(
              children: [
                // Humidity Display
                Text(
                  'Humidity 32%',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                ),
                const SizedBox(height: 24.0),
                // Schedule Information
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '20° from 00:00 to 8:00',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '24° from 08:00 to 00:00',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TemperatureGaugePainter extends CustomPainter {
  final double temperature;
  final double minTemperature;
  final double maxTemperature;

  TemperatureGaugePainter({
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 20;
    final tickCount = 60;

    // Create gradient for colored ticks
    final gradient = SweepGradient(
      startAngle: 0,
      endAngle: 2 * math.pi,
      colors: [
        Colors.blue[400]!,
        Colors.purple,
        Colors.redAccent,
        Colors.blue[400]!,
      ],
      stops: const [0.0, 0.33, 0.66, 1.0],
    );

    // Calculate current temperature progress
    final tempProgress =
        (temperature - minTemperature) / (maxTemperature - minTemperature);
    final activeTicks = (tickCount * tempProgress).round();

    // Draw background ticks (grey)
    for (int i = 0; i < tickCount; i++) {
      final angle = (i / tickCount) * 2 * math.pi - math.pi / 2;
      _drawTick(canvas, center, radius, angle, Colors.grey[300]!, false);
    }

    // Draw gradient colored ticks up to current temperature
    for (int i = 0; i < activeTicks; i++) {
      final angle = (i / tickCount) * 2 * math.pi - math.pi / 2;
      final progress = i / tickCount;

      // Sample color from gradient
      final color = _getGradientColor(progress);
      _drawTick(canvas, center, radius, angle, color, true);
    }

    // Draw indicator thumb
    final thumbAngle = (tempProgress * 2 * math.pi) - math.pi / 2;
    final thumbPosition = Offset(
      center.dx + radius * math.cos(thumbAngle),
      center.dy + radius * math.sin(thumbAngle),
    );

    final thumbPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawCircle(thumbPosition, 8, thumbPaint);

    // Draw white inner circle for thumb
    final innerThumbPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(thumbPosition, 4, innerThumbPaint);
  }

  void _drawTick(
    Canvas canvas,
    Offset center,
    double radius,
    double angle,
    Color color,
    bool isActive,
  ) {
    final tickPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = isActive ? 4.0 : 2.0
      ..strokeCap = StrokeCap.round;

    final tickLength = isActive ? 12.0 : 8.0;
    final startRadius = radius - tickLength;

    final startPoint = Offset(
      center.dx + startRadius * math.cos(angle),
      center.dy + startRadius * math.sin(angle),
    );

    final endPoint = Offset(
      center.dx + radius * math.cos(angle),
      center.dy + radius * math.sin(angle),
    );

    // Draw as small arc instead of line for better visual effect
    final rect = Rect.fromCircle(
      center: center,
      radius: (startRadius + radius) / 2,
    );
    final sweepAngle = 0.05; // Small arc angle

    canvas.drawArc(rect, angle - sweepAngle / 2, sweepAngle, false, tickPaint);
  }

  Color _getGradientColor(double progress) {
    // Create a simple gradient color interpolation
    if (progress <= 0.33) {
      final localProgress = progress / 0.33;
      return Color.lerp(Colors.blue[400]!, Colors.purple, localProgress)!;
    } else if (progress <= 0.66) {
      final localProgress = (progress - 0.33) / 0.33;
      return Color.lerp(Colors.purple, Colors.redAccent, localProgress)!;
    } else {
      final localProgress = (progress - 0.66) / 0.34;
      return Color.lerp(Colors.redAccent, Colors.blue[400]!, localProgress)!;
    }
  }

  @override
  bool shouldRepaint(covariant TemperatureGaugePainter oldDelegate) {
    return oldDelegate.temperature != temperature ||
        oldDelegate.minTemperature != minTemperature ||
        oldDelegate.maxTemperature != maxTemperature;
  }
}
