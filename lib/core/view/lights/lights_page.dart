import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LightsScreen extends StatefulWidget {
  const LightsScreen({super.key});

  @override
  State<LightsScreen> createState() => _LightsScreenState();
}

class _LightsScreenState extends State<LightsScreen> {
  // The current value of the slider, from 0.0 to 1.0.
  // This will control the fill level and the percentage display.
  double _sliderValue = 0.7;

  // Callback function to update the slider value from the child widget.
  void _onLightsChanged(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          // Percentage Text
          Text(
            '${(_sliderValue * 100).toInt()}%',
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '1 hour ago',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const Spacer(flex: 1),
          Image.asset(
            'assets/images/lights_front.png', // Replace with your image path
            width: 200,
            height: 200,
          ),

          // The custom slider widget
          OpacityLights(value: _sliderValue, onChanged: _onLightsChanged),
          const Spacer(flex: 2),

          // Bottom control buttons
          _buildControlButtons(),
          const Spacer(flex: 1),
        ],
      ),
    );
  }

  // Helper widget for the bottom row of buttons.
  Widget _buildControlButtons() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIconButton(Icons.power_settings_new),
          const SizedBox(width: 12),
          _buildIconButton(Icons.settings, isActive: true),
          const SizedBox(width: 12),
          _buildIconButton(Icons.color_lens),
          const SizedBox(width: 12),
          _buildIconButton(Icons.opacity),
        ],
      ),
    );
  }

  // Helper for a single icon button.
  Widget _buildIconButton(IconData icon, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: isActive ? Colors.black : Colors.grey),
    );
  }
}

/// A custom vertical slider widget that controls opacity/brightness.
class OpacityLights extends StatefulWidget {
  /// The current value of the slider, from 0.0 to 1.0.
  final double value;

  /// Callback for when the slider value changes.
  final ValueChanged<double> onChanged;

  const OpacityLights({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<OpacityLights> createState() => _OpacityLightsState();
}

class _OpacityLightsState extends State<OpacityLights> {
  void _handleVerticalDragUpdate(DragUpdateDetails details) {
    // Get the render box of the widget to calculate the local position.
    final box = context.findRenderObject() as RenderBox;
    // Calculate the new value based on the vertical drag position.
    // The position is inverted because drag starts from the top (0.0).
    // We clamp the value between 0.0 and 1.0 to avoid out-of-bounds errors.
    final newValue = 1.0 - (details.localPosition.dy / box.size.height);
    widget.onChanged(newValue.clamp(0.0, 1.0));
  }

  @override
  Widget build(BuildContext context) {
    // GestureDetector detects vertical drags to control the slider.
    return GestureDetector(
      onVerticalDragUpdate: _handleVerticalDragUpdate,
      onVerticalDragStart: (details) {}, // Can be used for initial press state
      child: SizedBox(
        // Set a fixed size for the slider area.
        width: 120,
        height: 240,
        // CustomPaint uses our painter to draw the slider.
        child: CustomPaint(
          painter: _LightsPainter(
            value: widget.value,
            activeColor: Colors.orange,
          ),
        ),
      ),
    );
  }
}

/// The CustomPainter responsible for drawing the slider.
class _LightsPainter extends CustomPainter {
  final double value; // The slider's value (0.0 to 1.0)
  final Color activeColor; // The main color of the slider fill

  _LightsPainter({required this.value, required this.activeColor});

  @override
  void paint(Canvas canvas, Size size) {
    // Define the full rounded rectangle shape for the slider.
    final RRect fullRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(size.width / 2),
    );

    // --- 1. Draw the background track ---
    final backgroundPaint = Paint()
      ..color = activeColor
          .withOpacity(0.25) // Lighter, semi-transparent color
      ..style = PaintingStyle.fill;
    canvas.drawRRect(fullRRect, backgroundPaint);

    // --- 2. Draw the active (filled) portion ---
    // Calculate the height of the fill based on the slider's value.
    final double fillHeight = value * size.height;

    // Create the rectangle for the filled portion, starting from the bottom.
    final Rect fillRect = Rect.fromLTWH(
      0,
      size.height - fillHeight, // Y-coordinate starts from the bottom up
      size.width,
      fillHeight,
    );

    // Create the RRect for the filled part.
    final RRect fillRRect = RRect.fromRectAndCorners(
      fillRect,
      bottomLeft: Radius.circular(size.width / 2),
      bottomRight: Radius.circular(size.width / 2),
      // Top corners are only rounded if the slider is at 100%
      topLeft: value == 1.0 ? Radius.circular(size.width / 2) : Radius.zero,
      topRight: value == 1.0 ? Radius.circular(size.width / 2) : Radius.zero,
    );

    final activePaint = Paint()
      ..color = activeColor
      ..style = PaintingStyle.fill;

    // We clip the canvas to the main shape to ensure the fill
    // doesn't draw outside the rounded corners.
    canvas.clipRRect(fullRRect);
    canvas.drawRRect(fillRRect, activePaint);

    // --- 3. Draw the draggable handle ---
    final handlePaint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    // The Y position of the handle is at the top of the fill area.
    final handleY = size.height - fillHeight;
    final handleWidth = size.width * 0.4; // Handle is 40% of the slider width
    final handleXOffset = (size.width - handleWidth) / 2;

    // Don't draw the handle if it's too close to the top or bottom edges.
    if (handleY > 10 && handleY < size.height - 10) {
      canvas.drawLine(
        Offset(handleXOffset, handleY),
        Offset(handleXOffset + handleWidth, handleY),
        handlePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _LightsPainter oldDelegate) {
    // The painter should repaint whenever the value changes.
    return oldDelegate.value != value;
  }
}
