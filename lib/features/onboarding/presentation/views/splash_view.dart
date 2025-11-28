import 'package:flutter/material.dart';
import 'package:myzani/core/colors.dart';
import 'package:myzani/features/onboarding/presentation/widgets/splash_view_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: SplashViewBody(),
    );
  }
}

