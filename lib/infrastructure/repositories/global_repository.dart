import 'package:flutter/cupertino.dart';
import 'package:pokedex_challenge/domain/repository_contracts/global_repository_contract.dart';

class GlobalRepository extends GlobalRepositoryContract {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
