import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final bool isOutline;
  final double elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double borderRadius;
  final double paddingVertical;
  final double paddingHorizontal;
  final Size fixedSize;
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.fixedSize = const Size(50, 30),
    this.isOutline = false,
    this.elevation = 0,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius = 10,
    this.paddingVertical = 10,
    this.paddingHorizontal = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        side: isOutline
            ? MaterialStateProperty.all<BorderSide>(
                BorderSide(color: Theme.of(context).primaryColor),
              )
            : MaterialStateProperty.all<BorderSide>(
                BorderSide.none,
              ),
        fixedSize: MaterialStateProperty.all<Size>(
          fixedSize,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          foregroundColor ?? Theme.of(context).primaryColor,
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: paddingVertical,
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor ?? Colors.transparent,
        ),
        elevation: MaterialStateProperty.all<double>(elevation),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
