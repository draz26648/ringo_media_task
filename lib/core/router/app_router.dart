import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ringo_dev_task/core/router/routes_strings.dart';
import 'package:ringo_dev_task/features/bottom_navigation/bottom_navigation.dart';
import 'package:ringo_dev_task/features/login/logic/cubit/login_cubit.dart';
import 'package:ringo_dev_task/features/login/ui/screens/login_screen.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          ),
        );

      case Routes.bottomNavigation:
        return MaterialPageRoute(
          builder: (context) => const BottomNavigation(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
