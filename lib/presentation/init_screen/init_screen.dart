import 'package:pokedex_challenge/presentation/init_screen/controller/init_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final InitScreenController _controller = Inject.get<InitScreenController>()!;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("INIT"),
      ),
    );
  }

  Future<void> _init() async {
    await _controller.initialize();
    await Future.delayed(const Duration(milliseconds: 2000));
    _gotoInitialRoute();
  }

  void _gotoInitialRoute() => _controller.gotoInitialRoute(context);
}
