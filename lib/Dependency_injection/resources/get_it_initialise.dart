import 'package:get_it/get_it.dart';
import 'package:neosoft_training_tasks/Dependency_injection/Example_1/resources/DI_example_1_BLOC.dart';

import 'bloc_class.dart';

final getIt = GetIt.instance;

void setup() {
  // This will register a single instance
  getIt.registerSingleton<BLOCclass>(BLOCclass());

  // This will return a new instance everytime
  // getIt.registerFactory<BLOCclass>(() => BLOCclass());
}
