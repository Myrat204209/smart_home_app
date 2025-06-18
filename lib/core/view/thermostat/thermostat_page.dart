
import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ThermostatScreen extends StatefulWidget {
  const ThermostatScreen({super.key});

  @override
  State<ThermostatScreen> createState() => _ThermostatScreenState();
}

class _ThermostatScreenState extends State<ThermostatScreen> {
  // Temperature is stored in Celsius. Let's assume a range from 10 to 35 degrees.
  double _temperature = 28.0;
  final double _minTemp = 10.0;
  final double _maxTemp = 35.0;

  void _onTemperatureChanged(double temp) {
    setState(() {
      // Clamp the temperature to the allowed range.
      _temperature = temp.clamp(_minTemp, _maxTemp);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Convert temperature to a progress value between 0.0 and 1.0 for the painter.
    double progress = (_temperature - _minTemp) / (_maxTemp - _minTemp);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                'Temperature',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              // The main thermostat widget
              ThermostatWidget(
                progress: progress,
                onChanged: (newProgress) {
                  // Convert progress back to temperature.
                  double newTemp = _minTemp + newProgress * (_maxTemp - _minTemp);
                  _onTemperatureChanged(newTemp);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_temperature.round()}°',
                      style: const TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const Text(
                      'Humidity 32%',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              _buildScheduleInfo('20° from 00:00 to 8:00'),
              const SizedBox(height: 8),
              _buildScheduleInfo('24° from 08:00 to 00:00'),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScheduleInfo(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }
}


/// A thermostat widget with a circular dial.
class ThermostatWidget extends StatefulWidget {
  /// The current progress value, from 0.0 to 1.0.
  final double progress;
  /// Callback for when the progress value changes due to user interaction.
  final ValueChanged<double> onChanged;
  /// The child widget to display in the center.
  final Widget child;

  const ThermostatWidget({
    super.key,
    required this.progress,
    required this.onChanged,
    required this.child,
  });

  @override
  State<ThermostatWidget> createState() => _ThermostatWidgetState();
}

class _ThermostatWidgetState extends State<ThermostatWidget> {
  // This key is used to get the size and position of the widget.
  final GlobalKey _paintKey = GlobalKey();

  void _handlePanUpdate(DragUpdateDetails details) {
    // Get the RenderBox to find the center of the widget.
    final RenderBox? box = _paintKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;

    final position = box.globalToLocal(details.globalPosition);
    final center = Offset(box.size.width / 2, box.size.height / 2);
    
    // Calculate the angle of the touch point relative to the center.
    final vector = position - center;
    double angle = math.atan2(vector.dy, vector.dx) + math.pi / 2;

    // Normalize the angle to be within the painter's range (3/4 of a circle).
    // The painter starts at 135 degrees and ends at 45 degrees.
    const fullAngle = 1.5 * math.pi; // 270 degrees
    const startAngle = -2.25 * math.pi / 2; // -135 degrees
    
    // Adjust angle to be positive
    if (angle < 0) angle += 2 * math.pi;

    // Find the closest point on the arc
    if (angle > math.pi && angle < startAngle + fullAngle) {
       // We are in the dead zone, do nothing
    } else {
        double progress;
        if (angle > startAngle + fullAngle) {
          progress = (angle - (2 * math.pi) - startAngle) / fullAngle;
        } else {
          progress = (angle - startAngle) / fullAngle;
        }
        widget.onChanged(progress.clamp(0.0, 1.0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _handlePanUpdate,
      onPanStart: (details) {},
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            key: _paintKey,
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: _ThermostatPainter(
                progress: widget.progress,
              ),
            ),
          ),
          // Place the child widget (temperature text) in the center.
          Container(
             width: 220,
             height: 220,
             alignment: Alignment.center,
             child: widget.child
          ),
        ],
      ),
    );
  }
}


/// The CustomPainter responsible for drawing the thermostat dial.
class _ThermostatPainter extends CustomPainter {
  final double progress; // The thermostat's progress (0.0 to 1.0)

  _ThermostatPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    
    // The dial is not a full circle, it's 270 degrees (1.5 * pi radians).
    // It starts at -225 degrees (-1.25 * pi) and sweeps 270 degrees.
    const startAngle = -2.25 * math.pi / 2;
    const sweepAngle = 1.5 * math.pi;
    final endAngle = startAngle + sweepAngle;

    // Define the bounding rectangle for the arc.
    final rect = Rect.fromCircle(center: center, radius: radius);

    // --- 1. Draw Background Ticks ---
    final backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    final totalTicks = 60;
    for (int i = 0; i < totalTicks; i++) {
      final tickProgress = i / totalTicks;
      final angle = startAngle + tickProgress * sweepAngle;
      // Draw a small arc for each tick
      canvas.drawArc(rect, angle, 0.02, false, backgroundPaint);
    }

    // --- 2. Draw Foreground Gradient Ticks ---
    final foregroundPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    // Define the gradient from blue to red.
    final gradient = SweepGradient(
      center: Alignment.center,
      startAngle: startAngle,
      endAngle: endAngle,
      colors: [Colors.blue, Colors.red],
      transform: const GradientRotation(math.pi / 2), // Rotate to align with the arc
    );
    foregroundPaint.shader = gradient.createShader(rect);
    
    final activeSweepAngle = progress * sweepAngle;
    final activeTicks = (totalTicks * progress).round();
     for (int i = 0; i < activeTicks; i++) {
      final tickProgress = i / totalTicks;
      final angle = startAngle + tickProgress * sweepAngle;
      canvas.drawArc(rect, angle, 0.02, false, foregroundPaint);
    }


    // --- 3. Draw the Draggable Handle ---
    final handleAngle = startAngle + activeSweepAngle;
    final handlePoint = Offset(
      center.dx + radius * math.cos(handleAngle),
      center.dy + radius * math.sin(handleAngle),
    );

    final handlePaint = Paint()
      ..color = Colors.red // Using the end color of the gradient
      ..style = PaintingStyle.fill;
      
    final handleShadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    // Draw shadow first
    canvas.drawCircle(handlePoint, 16, handleShadowPaint);
    // Draw handle on top
    canvas.drawCircle(handlePoint, 14, handlePaint);
  }

  @override
  bool shouldRepaint(covariant _ThermostatPainter oldDelegate) {
    // Repaint only if the progress value has changed.
    return oldDelegate.progress != progress;
  }
}
