import 'package:hive_flutter/hive_flutter.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String title = "cook";

  @HiveField(1)
  bool completed = false;

  Task(this.title, this.completed);
}
