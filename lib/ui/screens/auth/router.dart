import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/screens/auth/login/login.email.screen.dart';
import 'package:uni_dating_app/ui/screens/profile/eidt_init.screen.dart';
import 'package:uni_dating_app/ui/screens/profile/profile.edit.dart';
import 'package:uni_dating_app/utils/nested_navigator.dart';

import 'main/login.welcome.screen.dart';

class TheAuthRouter extends StatelessWidget {
  const TheAuthRouter({Key? key}) : super(key: key);

  Route<dynamic> _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginEmailScreen.routeName:
        return MaterialPageRoute<dynamic>(
          settings: settings,
          builder: (context) => const LoginEmailScreen(),
        );
      case LoginWelcomeScreen.routeName:
        return MaterialPageRoute<dynamic>(
          settings: settings,
          builder: (context) => const LoginWelcomeScreen(),
        );
      case EditInitScreen.routeName:
        return MaterialPageRoute<dynamic>(
          settings: settings,
          builder: (context) => const EditInitScreen(),
        );
      default:
        throw ArgumentError.value(
          settings.name,
          'settings.name',
          'Unsupported route',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: NestedNavigator(
        onGenerateRoute: (settings) {
          var newSettings = settings;
          if (settings.name == '/') {
            newSettings = settings.copyWith();
          }
          return _generateRoute(newSettings);
        },
      ),
    );
  }
}
