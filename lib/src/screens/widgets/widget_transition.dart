import 'package:flutter/material.dart';

class WidgetTransition extends StatefulWidget {
  final Widget child;

  const WidgetTransition({Key key, @required this.child}) : super(key: key);

  @override
  _WidgetTransitionState createState() => _WidgetTransitionState();
}

class _WidgetTransitionState extends State<WidgetTransition>
    with SingleTickerProviderStateMixin {
  Widget oldWidget = Container();
  Widget newWidget = Container();
  AnimationController _widgetSliderAnimationController;
  Animation<double> _opecAnimation;

  @override
  void initState() {
    super.initState();
    oldWidget = widget.child;

    _widgetSliderAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          oldWidget = newWidget;
          newWidget = Container();
          _widgetSliderAnimationController.value = 0.0;
        });
      }
    });

    _opecAnimation = CurvedAnimation(
      parent: _widgetSliderAnimationController,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Opacity(opacity: 1.0, child: oldWidget,),
        AnimatedBuilder(
          animation: _opecAnimation,
          child: newWidget,
          builder: (context, child){
            return FadeTransition(opacity: _opecAnimation, child: child,);
          },
        ),
      ],
    );
  }

  @override
  void didUpdateWidget(WidgetTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.child != oldWidget.child) {
      newWidget = widget.child;
      _widgetSliderAnimationController.forward();
    }
  }

  @override
  void dispose() {
    _widgetSliderAnimationController.dispose();
    super.dispose();
  }
}