import 'package:hive/hive.dart';
import 'package:neosoft_training_tasks/HIVE_Database/resources/todo_model.dart';
import 'package:path_provider/path_provider.dart';

const String todoBoxName = "todo";
Future<void> initialiseHive() async {
  // Step 1
  final document = await getApplicationDocumentsDirectory();
  // Step 2
  Hive.init(document.path);
  // First go to model and add@Hive initiliser
  // then add this step
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>(todoBoxName);
}
