import 'package:flutter/material.dart';
import 'package:uni_dating_app/repositories/news/network_news.repository.dart';
import 'package:uni_dating_app/repositories/news/news.repository.dart';
import 'package:uni_dating_app/repositories/users/network_users.repository.dart';
import 'package:uni_dating_app/repositories/users/users.repository.dart';
import 'package:uni_dating_app/services/preferences/preference.service.dart';
import 'package:uni_dating_app/utils/firebase.initializer.dart';
import 'package:uni_dating_app/utils/provider.service.dart';

typedef InitializationBuilder = Widget Function(
  BuildContext context,
  String initialRoute,
);

/// Initializer of services and/or plugins that runs before app is started.
Future<void> preInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceService().init();

}

/// App-wide initializer of all services, repositories, plugins, etc.
class Initializer extends StatefulWidget {
  /// Constructs an instance of [Initializer].
  const Initializer({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final InitializationBuilder builder;

  @override
  _InitializerState createState() => _InitializerState();
}

class _InitializerState extends State<Initializer> {
  late NewsRepository newsRepository;
  late UsersRepository usersRepository;

  @override
  void initState() {
    FirebaseInitializer.initialize();

     final networkNewsRepository = NetworkNewsRepository();
     newsRepository = NewsRepository(networkNewsRepository);

     final networkUsersRepository = NetworkUsersRepository();
     usersRepository = UsersRepository(networkUsersRepository);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderService(
      data: <Type, dynamic>{
        NewsRepository: newsRepository,
        UsersRepository: usersRepository,
      },
      builder: (context) {
        return widget.builder(context, '/');
      },
    );
  }
}
