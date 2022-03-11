import 'package:lovemoney_fe/core/util/env_config.dart';

class APIConst {
  static String _baseUrl = "";

  static String get baseUrl => _baseUrl;

  static void setBaseUrl(Enviroment env) {
    switch(env) {
      case Enviroment.LOCAL:
        _baseUrl = EnvConfig.baseUrlLocal;
        break;
      case Enviroment.PRODUCTION:
        _baseUrl = EnvConfig.baseUrlProduction;
        break;
    }
  }
}
enum Enviroment {LOCAL, PRODUCTION}