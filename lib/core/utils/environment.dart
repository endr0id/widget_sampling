import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String getHostName() {
    final hostName = dotenv.env['HOST_NAME'];

    if (hostName == null) {
      throw Exception('HOST_NAME is not defined in .env file');
    }

    return hostName;
  }
}
