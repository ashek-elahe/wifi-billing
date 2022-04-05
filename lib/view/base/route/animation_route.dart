import 'package:flutter/material.dart';

class AnimatedPageRoute extends PageRouteBuilder{
  final Widget screen;
  AnimatedPageRoute({this.screen})
      :super(
      transitionDuration: Duration(milliseconds: 400),
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,Widget child){
        return ScaleTransition(scale: animation,alignment: Alignment.center,child: child);
      },
      pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation){
        return screen;
      });
}


class BottomToRight extends PageRouteBuilder{
  final Widget screen;
  BottomToRight({this.screen})
      :super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation) => screen,
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(1.0,1.0),
          end: Offset.zero,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: Offset(0.0,1.0),
            ).animate(secAnimation),
            child: child),
      );
    },
  );
}

class BottomToLeft extends PageRouteBuilder{
  final Widget screen;
  BottomToLeft({this.screen})
      :super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation) => screen,
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-1.0,1.0),
          end: Offset.zero,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: Offset(-0.0,1.0),
            ).animate(secAnimation),
            child: child),
      );
    },
  );
}


class TopToRight extends PageRouteBuilder{
  final Widget screen;
  TopToRight({this.screen})
      :super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation) => screen,
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(1.0,-1.0),
          end: Offset.zero,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: Offset(0.0,1.0),
            ).animate(secAnimation),
            child: child),
      );
    },
  );
}


class RightToLeft extends PageRouteBuilder{
  final Widget screen;
  RightToLeft({this.screen})
      :super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation) => screen,
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-1.0,0.0),
          end: Offset.zero,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: Offset(-1.0,0.0),
            ).animate(secAnimation),
            child: child),
      );
    },
  );
}


class TopToBottom extends PageRouteBuilder{
  final Widget screen;
  TopToBottom({this.screen})
      :super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation) => screen,
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0.0,-1.0),
          end: Offset.zero,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: Offset(0.0,-1.0),
            ).animate(secAnimation),
            child: child),
      );
    },
  );
}


class TopLeft extends PageRouteBuilder{
  final Widget screen;
  TopLeft({this.screen})
      :super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation) => screen,
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-1.0,-1.0),
          end: Offset.zero,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: Offset(0.0,-1.0),
            ).animate(secAnimation),
            child: child),
      );
    },
  );
}



class CurveAnimation extends PageRouteBuilder{
  final Widget screen;
  CurveAnimation({this.screen})
      :super(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,Widget child){
        animation= CurvedAnimation(
          parent: animation,
          curve: Curves.bounceIn,
        );
        return ScaleTransition(scale: animation,alignment: Alignment.center,child: child);
      },
      pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation){
        return screen;
      });
}


class CenterCurveAnimation extends PageRouteBuilder{
  final Widget screen;
  CenterCurveAnimation({this.screen})
      :super(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,Widget child){
        animation= CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutCirc,
        );
        return ScaleTransition(scale: animation,alignment: Alignment.center,child: child);
      },
      pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation){
        return screen;
      });
}


class BottomTop extends PageRouteBuilder{
  final Widget screen;
  BottomTop({this.screen})
      :super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation) => screen,
    transitionDuration: Duration(milliseconds: 500),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0.0,1.0),
          end:  Offset.zero,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: Offset(0.0,1.0),
            ).animate(secAnimation),
            child: child),
      );
    },
  );
}

class LeftTop extends PageRouteBuilder{
  final Widget screen;
  LeftTop({this.screen})
      :super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation) => screen,
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0.0,1.0),
          end:  Offset.zero,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: Offset(0.0,1.0),
            ).animate(secAnimation),
            child: child),
      );
    },
  );
}