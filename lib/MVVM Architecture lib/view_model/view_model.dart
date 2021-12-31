abstract class SubscriptionViewModel {
  Sink get inputMailText;
  Stream<bool> get outputIsButtonEnabled;
  Stream<String?> get outputErrorText;

  void dispose();
}
