import 'package:flutter/material.dart';
import 'package:uni_dating_app/initializer.dart';
import 'package:uni_dating_app/ui/screens/auth/splash.screen.dart';

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

