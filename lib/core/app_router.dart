import 'package:go_router/go_router.dart';
import 'package:myzani/features/auth/presentation/views/login_view.dart';
import 'package:myzani/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:myzani/features/onboarding/presentation/views/splash_view.dart';

class AppRouter {
  static final String splash='/';
  static final String onboarding='/onboarding';
  static final String login='/login';
  static final GoRouter router = GoRouter(
    initialLocation:splash ,
    routes: [
      GoRoute(
        path: splash,
        name: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: onboarding,
        name: onboarding,
        builder: (context, state) => const OnboardingView(),
      ),
GoRoute(path: login,
        name: login,
        builder: (context, state) => const LoginView(),
      ),

    ],
  );
}
