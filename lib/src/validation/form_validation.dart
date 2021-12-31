class FormValidationCustom {
  static firstName(String? val) {
    if (val!.isEmpty) {
      return "First name cannot be empty";
    }

    return null;
  }

  static lastName(String? val) {
    if (val!.isEmpty) {
      return "Last name cannot be empty";
    }

    return null;
  }

  static email(String? val) {
    if (val!.isEmpty) {
      return "Email cannot be empty";
    } else if (!val.contains('@')) {
      return "Enter a valid email";
    }

    return null;
  }

  static phoneNumber(String? val) {
    if (val!.isEmpty) {
      return "Phone number cannot be empty";
    } else if (!val.contains(RegExp("^[0-9]+\$"))) {
      return "Phone number not valid";
    } else if (val.length != 10) {
      return "Phone number not valid";
    }

    return null;
  }
}
