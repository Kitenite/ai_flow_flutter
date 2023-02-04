import 'package:uuid/uuid.dart';

String createUUID() {
  return const Uuid().v4();
}
