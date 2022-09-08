import 'package:uuid/uuid.dart';

class MyThoughts {
  final String id;
  final String name;
  bool isDone = false;
  MyThoughts({String? id, required this.name, this.isDone = false})
      : assert(id == null || id.isNotEmpty),
        id = id ?? const Uuid().v4();
}
