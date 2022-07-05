part of 'app.dart';

Route<dynamic> _generateRoute(RouteSettings settings, BuildContext context) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => const SplashScreen(),
      );
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
    case ProfileEditScreen.routeName:
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => const ProfileEditScreen(),
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
