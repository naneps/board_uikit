import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({Key? key, this.mobile, this.tablet, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (MediaQuery.of(context).orientation == Orientation.landscape) {
          return _buildLandscapeLayout(constraints);
        } else {
          return _buildPortraitLayout(constraints);
        }
      },
    );
  }

  Widget _buildLandscapeLayout(BoxConstraints constraints) {
    if (constraints.maxWidth > 1200) {
      return desktop ?? tablet ?? mobile ?? Container();
    } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
      return tablet ?? mobile ?? Container();
    } else {
      return mobile ?? Container();
    }
  }

  Widget _buildPortraitLayout(BoxConstraints constraints) {
    if (constraints.maxWidth > 800) {
      return tablet ?? mobile ?? Container();
    } else {
      return mobile ?? Container();
    }
  }
}
