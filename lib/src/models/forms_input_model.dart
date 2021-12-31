class FormInputModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? gender;
  String? empStatus;
  String? qualification;
  FormInputModel? formInputModel;

  FormInputModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.empStatus,
    required this.qualification,
    this.formInputModel,
  });
}
