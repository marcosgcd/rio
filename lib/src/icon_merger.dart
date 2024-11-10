import 'package:flutter/material.dart';

class RioIconMerger extends StatelessWidget {
  const RioIconMerger({
    super.key,
    required this.icon,
    required this.subIcon,
    this.size,
    this.holeRadiusMultiplier = 0.25,
    this.subIconSizeMultiplier = 1.6,
    this.holeCenterXMultiplier = 1.0,
    this.holeCenterYMultiplier = 1.2,
  });

  final double? size;
  final IconData icon;
  final IconData subIcon;
  final double holeRadiusMultiplier;
  final double subIconSizeMultiplier;
  final double holeCenterXMultiplier;
  final double holeCenterYMultiplier;

  @override
  Widget build(BuildContext context) {
    // Define the size of the main icon
    final double iconSize = size ?? IconTheme.of(context).size ?? 24.0;

    // Calculate the radius of the hole (20% of the icon size)
    final double holeRadius = iconSize * holeRadiusMultiplier;

    // Increase the size of the subIcon (120% of the hole radius)
    final double subIconSize = holeRadius * subIconSizeMultiplier;

    // Adjust the hole center position to move it more towards the center
    final double holeCenterX = iconSize - holeRadius * holeCenterXMultiplier;
    final double holeCenterY = iconSize - holeRadius * holeCenterYMultiplier;

    return SizedBox(
      width: iconSize,
      height: iconSize,
      child: Stack(
        children: <Widget>[
          // Clip the main icon with a hole
          ClipPath(
            key: ValueKey(holeRadius + holeCenterX + holeCenterY),
            clipper: HoleClipper(
              holeRadius: holeRadius,
              holeCenterX: holeCenterX,
              holeCenterY: holeCenterY,
            ),
            child: Icon(icon, size: iconSize),
          ),
          // Position the subIcon in the center of the hole
          Positioned(
            left: holeCenterX - subIconSize / 2,
            top: holeCenterY - subIconSize / 2,
            child: Icon(
              subIcon,
              size: subIconSize,
            ),
          ),
        ],
      ),
    );
  }
}

// CustomClipper to create a hole in the main icon
class HoleClipper extends CustomClipper<Path> {
  final double holeRadius;
  final double holeCenterX;
  final double holeCenterY;

  HoleClipper({
    required this.holeRadius,
    required this.holeCenterX,
    required this.holeCenterY,
  });

  @override
  Path getClip(Size size) {
    final path = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Create the hole path at the adjusted position
    final holePath = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(holeCenterX, holeCenterY),
          radius: holeRadius,
        ),
      );

    // Subtract the hole from the main path
    return Path.combine(PathOperation.difference, path, holePath);
  }

  @override
  bool shouldReclip(HoleClipper oldClipper) => false;
}
