import 'dart:async';

import 'package:neosoft_training_tasks/MVVM%20Architecture%20lib/validation/email_validation.dart';
import 'package:neosoft_training_tasks/MVVM%20Architecture%20lib/view_model/view_model.dart';

class SubscriptionViewModelImpl implements SubscriptionViewModel {
  var _mailTextController = StreamController<String>.broadcast();

  @override
  Sink get inputMailText => _mailTextController.sink;

  @override
  Stream<bool> get outputIsButtonEnabled => _mailTextController.stream.map(
        (email) => EmailValidator.isEmailValid(email),
      );

  @override
  Stream<String?> get outputErrorText => outputIsButtonEnabled.map(
        (isEnabled) => isEnabled ? null : "Invalid email",
      );

  @override
  void dispose() => _mailTextController.close();
}
