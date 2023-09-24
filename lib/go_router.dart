import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfirebase/features/authentication/repos/authentication_repo.dart';
import 'package:flutterfirebase/features/home/home_screen.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: '/',
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;
        if (!isLoggedIn) {
          if (state.subloc != HomeScreen.routeURL) {
            return '/';
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          name: HomeScreen.routeName,
          path: HomeScreen.routeURL,
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  },
);
