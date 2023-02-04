import 'package:uuid/uuid.dart';

class UUIDUtil {
  static String createUUID() {
    return const Uuid().v4();
  }
}
