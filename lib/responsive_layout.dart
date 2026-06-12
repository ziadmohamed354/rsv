import 'package:flutter/material.dart';

class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        Color color;
        double height;
        double containerWidth;

        if (width < 600) {
          // Mobile
          color = Colors.blue;
          height = 150;
          containerWidth = 150;
        } else if (width < 1024) {
          // Tablet
          color = Colors.green;
          height = 250;
          containerWidth = 300;
        } else {
          // Desktop
          color = Colors.orange;
          height = 350;
          containerWidth = 500;
        }

        return Scaffold(
          body: Center(
            child: Container(
              width: containerWidth,
              height: height,
              color: color,
              child: const Center(
                child: Text(
                  "Responsive Container",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
