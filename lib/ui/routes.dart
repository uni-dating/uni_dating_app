part of 'app.dart';

Route<dynamic> _generateRoute(RouteSettings settings, BuildContext context) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => const SplashScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => const LoginScreen(),
      );
    case SignupScreen.routeName:
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => const SignupScreen(),
      );
    case MainInitScreen.routeName:
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => const MainInitScreen(),
      );
    default:
      throw ArgumentError.value(
        settings.name,
        'settings.name',
        'Unsupported route',
      );
  }
}
