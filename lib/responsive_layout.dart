import 'package:flutter/material.dart';

import 'package:rsv/responsive_screen.dart';

import 'taplaet.dart';
import 'desktop.dart';

class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        if (width < 600) {
          return const MobileHomePage();
        } else if (width < 1024) {
          return const TabletHomePage();
        } else {
          return const DesktopHomePage();
        }
      },
    );
  }
}
