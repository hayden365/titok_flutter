import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:titok_flutter/features/authentication/email_screen.dart';
import 'package:titok_flutter/features/authentication/login_screen.dart';
import 'package:titok_flutter/features/authentication/repos/authentication_repo.dart';
import 'package:titok_flutter/features/authentication/sign_up_screen.dart';
import 'package:titok_flutter/features/authentication/username_screen.dart';
import 'package:titok_flutter/features/onboarding/interests_screen.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.matchedLocation != SignUpScreen.routeURL &&
            state.matchedLocation != LoginScreen.routeURL) {
          return SignUpScreen.routeURL;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: SignUpScreen.routeURL,
        name: SignUpScreen.routeName,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: LoginScreen.routeURL,
        name: LoginScreen.routeName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: InterestsScreen.routeURL,
        name: InterestsScreen.routeName,
        builder: (context, state) => const InterestsScreen(),
      ),
    ],
  );
  //GoRoute(
  //  path: LoginScreen.routeURL,
  //  builder: (context, state) => const LoginScreen(),
  //),
  //GoRoute(
  //  path: UsernameScreen.routeName,
  //  builder: (context, state) => const UsernameScreen(),
  //),
});
