part of 'app.dart';

Route<dynamic> _generateRoute(RouteSettings settings, BuildContext context) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => const SplashScreen(),
      );
    default:
      throw ArgumentError.value(
        settings.name,
        'settings.name',
        'Unsupported route',
      );
  }
}
