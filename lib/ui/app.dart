import 'package:flutter/material.dart';
import 'package:uni_dating_app/initializer.dart';
import 'package:uni_dating_app/ui/screens/auth/auth_init.screen.dart';
import 'package:uni_dating_app/ui/screens/auth/login/login.email.screen.dart';
import 'package:uni_dating_app/ui/screens/auth/main/login.welcome.screen.dart';
import 'package:uni_dating_app/ui/screens/auth/splash/splash_init.screen.dart';
import 'package:uni_dating_app/ui/screens/main/main_init.screen.dart';
import 'package:uni_dating_app/ui/screens/profile/eidt_init.screen.dart';
import 'package:uni_dating_app/ui/screens/profile/profile.edit.dart';

part 'routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Initializer(
      builder: (context, initialRoute) {
        return MaterialApp(
          initialRoute: initialRoute,
          onGenerateRoute: (settings) {
            return _generateRoute(settings, context);
          },
        );
      },
    );
  }
}

