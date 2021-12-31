import 'package:hive/hive.dart';

part 'todo_model.g.dart';

/// Command
/// flutter packages pub run build_runner build

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String detail;
  @HiveField(2)
  final bool completed;

  TodoModel({
    required this.title,
    required this.detail,
    required this.completed,
  });
}
