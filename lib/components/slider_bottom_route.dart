import 'package:flutter/material.dart';

class SliderBottomRoute extends PageRouteBuilder {
  final Widget page;

  SliderBottomRoute({ this.page }) : super(
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      return page;
    },
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn
        )),
        child: child,
      );
    }
  );
}
