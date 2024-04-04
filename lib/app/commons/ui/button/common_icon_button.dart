import 'package:flutter/material.dart';

class CommonIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final EdgeInsets? padding;
  final double iconSize;
  final Size fixedSize;
  final bool isOutline;
  final Color iconColor;
  final Color color;
  final int borderRadius;
  final String tooltip;
  const CommonIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.iconSize = 26,
    this.isOutline = false,
    this.tooltip = '',
    this.fixedSize = const Size(40, 40),
    this.iconColor = Colors.white,
    this.borderRadius = 5,
    this.color = Colors.transparent,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          padding ?? const EdgeInsets.all(0),
        ),
        minimumSize: MaterialStateProperty.all<Size>(const Size(10, 10)),
        iconColor: MaterialStateProperty.all<Color>(
          iconColor,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          isOutline ? Colors.transparent : color,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.toDouble()),
            side: isOutline ? BorderSide(color: color) : BorderSide.none,
          ),
        ),
        fixedSize: MaterialStateProperty.all<Size>(
          fixedSize,
        ),
        iconSize: MaterialStateProperty.all<double>(iconSize),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
