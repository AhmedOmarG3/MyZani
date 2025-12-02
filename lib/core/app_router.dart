import 'package:go_router/go_router.dart';
import 'package:myzani/features/auth/presentation/views/forget_password_view.dart';
import 'package:myzani/features/auth/presentation/views/login_view.dart';
import 'package:myzani/features/auth/presentation/views/sign_up_view.dart';
import 'package:myzani/features/home/presentation/views/home_view.dart';
import 'package:myzani/features/add_transaction/presentation/views/add_transaction_view.dart';
import 'package:myzani/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:myzani/features/onboarding/presentation/views/splash_view.dart';

class AppRouter {
  static final String splash = '/';
  static final String onboarding = '/onboarding';
  static final String login = '/login';
  static final String signUp = '/signUp';
  static final String forgetPassword = '/forgetPassword';
  static final String home = '/home';
  static final String addTrasaction = '/addTrasaction';
  static final GoRouter router = GoRouter(
    initialLocation: splash,
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
      GoRoute(
        path: login,
        name: login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: signUp,
        name: signUp,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: forgetPassword,
        name: forgetPassword,
        builder: (context, state) => const ForgetPasswordView(),
      ),

      GoRoute(
        path: home,
        name: home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: addTrasaction,
        name: addTrasaction,
        builder: (context, state) => const AddTransactionView(),
      ),
    ],
  );
}
