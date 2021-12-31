class EmailValidator {
  static bool isEmailValid(String email) {
    if (!email.contains('@') || !email.contains('.com')) {
      return false;
    }
    return true;
  }
}
