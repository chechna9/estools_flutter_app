import 'package:estools_mobile/pages/Login.dart';
import 'package:estools_mobile/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:estools_mobile/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage())));
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    final _curvedAnimation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInExpo,
      reverseCurve: Curves.easeInQuad, //easinOut
    );
    _animationController!.forward();
    _animation = Tween<double>(begin: 0.7, end: 0.8).animate(_curvedAnimation)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController!.forward();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.4, 1],
            colors: [
              myDark,
              myRed,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Transform.scale(
              scale: _animation!.value,
              child: SvgPicture.asset(
                EstlAssets.logoWO,
              ),
            ),
            Text(
              "Every Student's Tool",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
