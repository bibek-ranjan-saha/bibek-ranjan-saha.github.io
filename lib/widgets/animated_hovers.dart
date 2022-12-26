import 'package:flutter/material.dart';

class HoveringIcons extends StatefulWidget{
  const HoveringIcons({Key? key}) : super(key: key);

  @override
  State<HoveringIcons> createState() => _HoveringIconsState();
}

class _HoveringIconsState extends State<HoveringIcons> with SingleTickerProviderStateMixin{

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 100),
  )..forward()..repeat();

  double beginX = 23;
  double beginY =23;

  double endX = 45;
  double endY = 45;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

    late final Animation<Offset> _animation = Tween<Offset>(
      begin: Offset(beginX, beginY),
      end: Offset(endX, endY),
    ).animate(_animationController);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SlideTransition(
          position: _animation,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        )
    );
  }
}
