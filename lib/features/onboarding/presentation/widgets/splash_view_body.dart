
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myzani/core/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacityAnimation;
  late Animation<Offset> translationAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    opacityAnimation.addListener(() {
      setState(() {});
    });

    translationAnimation = Tween(
      begin: const Offset(0, -120),
      end: const Offset(0, 0),
    ).animate(animationController);

    translationAnimation.addListener(() {
      setState(() {});
    });
    animationController.forward();

    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        context.push(AppRouter.onboarding);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: opacityAnimation.value,
      child: Transform.translate(
        offset: translationAnimation.value,
        child: Opacity(
          opacity: opacityAnimation.value,
          child: Center(
            child: Text(
              'MyZani',
              style: TextStyle(
                color: Colors.white,
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}