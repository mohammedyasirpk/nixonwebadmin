import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key, required this.desktop, required this.tablet});

  final Widget desktop;
  final Widget tablet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth < 1000){
        return tablet;
      }else {
        return desktop;
      }
    },);
  }
}