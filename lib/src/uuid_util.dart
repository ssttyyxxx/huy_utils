

import 'package:uuid/uuid.dart';

class UuidUtil {
  static UuidUtil? _instance;

  static Uuid? _uuid;

  UuidUtil._internal() {
    _uuid = const Uuid();
  }

  factory UuidUtil() {
    _instance ??= UuidUtil._internal();
    return _instance!;
  }

  v1() {
    return _uuid!.v1();
  }

  v4() {
    return _uuid!.v4();
  }

  v5({required String name, String namespace = Uuid.NAMESPACE_URL}) {
    return _uuid!.v5(namespace, name);
  }
}