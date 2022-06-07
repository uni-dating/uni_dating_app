import 'package:flutter/material.dart';
import 'package:uni_dating_app/utils/firebase.initializer.dart';
import 'package:uni_dating_app/utils/provider.service.dart';

typedef InitializationBuilder = Widget Function(
  BuildContext context,
  String initialRoute,
);

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
  //late LeaderboardRepository leaderboardRepository;

  @override
  void initState() {
    FirebaseInitializer.initialize();

    // final networkLeaderboardRepository = NetworkLeaderboardRepository();
    // leaderboardRepository = LeaderboardRepository(networkLeaderboardRepository);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderService(
      data: <Type, dynamic>{
        //LeaderboardRepository: leaderboardRepository,
      },
      builder: (context) {
        return widget.builder(context, '/');
      },
    );
  }
}
