import 'package:flutter/cupertino.dart';

import 'app_routes.dart';

class AppTransations {
  static PageRouteBuilder<dynamic> getSlideTransationRtL<T>(
      {RouteSettings? settings, required Widget transitionChild}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) => transitionChild,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
              .chain(CurveTween(curve: Curves.easeInOut))
              .animate(animation),
          child: child,
        );
      },
    );
  }

  static PageRouteBuilder<dynamic> getSlideTransationBtT(
      {RouteSettings? settings, required Widget transitionChild}) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) => transitionChild,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0.0, 1.0), end: Offset.zero)
              .chain(CurveTween(curve: Curves.ease))
              .animate(animation),
          child: child,
        );
      },
    );
  }
}
