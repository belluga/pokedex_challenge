import 'package:pokedex_challenge/domain/api_handler/endpoint_type.dart';

abstract class EndpointSettingsContract {
  EndpointType get type;
  String get node;
}