import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PokedexApp {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
