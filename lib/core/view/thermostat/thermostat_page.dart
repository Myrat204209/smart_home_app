// import 'dart:math' as math;

// import 'package:flutter/material.dart';

// class ThermostatScreen extends StatefulWidget {
//   const ThermostatScreen({super.key});

//   @override
//   _ThermostatScreenState createState() => _ThermostatScreenState();
// }

// class _ThermostatScreenState extends State<ThermostatScreen> {
//   double _temperature = 28.0;
//   final double _minTemp = 20.0;
//   final double _maxTemp = 30.0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Title Text
//             Text(
//               'Temperature',
//               style: TextStyle(
//                 fontSize: 26.0,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey[800],
//               ),
//             ),
//             // Core Temperature Gauge & Display
//             SizedBox(
//               width: 250,
//               height: 250,
//               child: GestureDetector(
//                 onPanUpdate: (details) {
//                   final center = Offset(125, 125);
//                   final dragAngle = (details.localPosition - center).direction;
//                   final tempRange = _maxTemp - _minTemp;
//                   final angleRange = math.pi; // 180 degrees
//                   setState(() {
//                     _temperature =
//                         _minTemp +
//                         ((dragAngle + math.pi / 2) / angleRange) * tempRange;
//                     _temperature = _temperature.clamp(_minTemp, _maxTemp);
//                   });
//                 },
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     CustomPaint(
//                       painter: TemperatureGaugePainter(
//                         _temperature,
//                         _minTemp,
//                         _maxTemp,
//                       ),
//                       child: Container(),
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: _temperature.toStringAsFixed(0),
//                             style: TextStyle(
//                               fontSize: 90.0,
//                               fontWeight: FontWeight.w300,
//                               color: Colors.grey[800],
//                             ),
//                           ),
//                           TextSpan(
//                             text: '°',
//                             style: TextStyle(
//                               fontSize: 40.0,
//                               fontWeight: FontWeight.w300,
//                               color: Colors.grey[800],
//                               fontFeatures: [FontFeature.superscripts()],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // Humidity Display
//             Text(
//               'Humidity 32%',
//               style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
//             ),
//             // Schedule Information
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   '20° from 00:00 to 8:00',
//                   style: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
//                 ),
//                 Text(
//                   '24° from 08:00 to 00:00',
//                   style: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TemperatureGaugePainter extends CustomPainter {
//   final double currentTemp;
//   final double minTemp;
//   final double maxTemp;

//   TemperatureGaugePainter(this.currentTemp, this.minTemp, this.maxTemp);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2 - 20;
//     final tickPaint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.0
//       ..color = Colors.grey[300]!;

//     // Draw background ticks
//     for (int i = 0; i <= 20; i++) {
//       final angle = -math.pi / 2 + (math.pi / 20) * i;
//       final startPoint =
//           center +
//           Offset(
//             math.cos(angle) * (radius - 10),
//             math.sin(angle) * (radius - 10),
//           );
//       final endPoint =
//           center + Offset(math.cos(angle) * radius, math.sin(angle) * radius);
//       canvas.drawLine(startPoint, endPoint, tickPaint);
//     }

//     // Draw gradient ticks
//     final gradient = SweepGradient(
//       startAngle: -math.pi / 2,
//       endAngle: math.pi / 2,
//       colors: [Colors.blue[400]!, Colors.purple, Colors.redAccent],
//       stops: [0.0, 0.5, 1.0],
//     );
//     final tempProgress = (currentTemp - minTemp) / (maxTemp - minTemp);
//     for (int i = 0; i <= 20 * tempProgress; i++) {
//       final angle = -math.pi / 2 + (math.pi / 20) * i;
//       final rect = Rect.fromCircle(center: center, radius: radius - 5);
//       final paint = Paint()
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 4.0
//         ..shader = gradient.createShader(
//           rect,
//           textDirection: TextDirection.ltr,
//         );
//       canvas.drawArc(
//         Rect.fromCircle(center: center, radius: radius - 5),
//         angle - 0.05,
//         0.1,
//         false,
//         paint,
//       );
//     }

//     // Draw indicator thumb
//     final thumbAngle = -math.pi / 2 + (math.pi * tempProgress);
//     final thumbPosition =
//         center +
//         Offset(math.cos(thumbAngle) * radius, math.sin(thumbAngle) * radius);
//     final thumbPaint = Paint()..color = Colors.red;
//     canvas.drawCircle(thumbPosition, 8.0, thumbPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
