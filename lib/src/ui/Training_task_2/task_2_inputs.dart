import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/src/blocs/education_Q_BLOC.dart';
import 'package:neosoft_training_tasks/src/blocs/employment_BLOC.dart';
import 'package:neosoft_training_tasks/src/blocs/form_input_info_BLOC.dart';
import 'package:neosoft_training_tasks/src/blocs/gender_BLOC.dart';
import 'package:neosoft_training_tasks/src/constants/colors.dart';
import 'package:neosoft_training_tasks/src/models/forms_input_model.dart';
import 'package:neosoft_training_tasks/src/resources/navigation.dart';
import 'package:neosoft_training_tasks/src/validation/form_validation.dart';
import 'package:neosoft_training_tasks/src/widgets/appbar.dart';
import 'package:neosoft_training_tasks/src/widgets/text_field_decorations.dart';

class Task2Inputs extends StatefulWidget {
  final FormInputInfoBLOC formInputInfoBLOC;

  const Task2Inputs({
    Key? key,
    required this.formInputInfoBLOC,
  }) : super(key: key);

  @override
  _Task2InputsState createState() => _Task2InputsState();
}

class _Task2InputsState extends State<Task2Inputs> {
  final _formKey = new GlobalKey<FormState>();

  late final TextEditingController _firstNameCntrl;
  late final TextEditingController _lasttNameCntrl;
  late final TextEditingController _emailCntrl;
  late final TextEditingController _phoneCntrlCntrl;

  GenderBLOC _genderBLOC = new GenderBLOC();
  EmploymentBLOC _employmentBLOC = new EmploymentBLOC();
  EducationQBLOC _educationQBLOC = new EducationQBLOC();

  @override
  void dispose() {
    _employmentBLOC.dispose();
    _educationQBLOC.dispose();
    _genderBLOC.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _firstNameCntrl = new TextEditingController();
    _lasttNameCntrl = new TextEditingController();
    _emailCntrl = new TextEditingController();
    _phoneCntrlCntrl = new TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CYAN,
      resizeToAvoidBottomInset: false,
      appBar: _appbar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
            child: ListView(
              padding: EdgeInsets.fromLTRB(20, 30, 10, 20),
              children: [
                _firstNameTextField(),
                _sizeBox,
                _lastNameTextField(),
                _sizeBox,
                _Gender(genderBLOC: _genderBLOC),
                _sizeBox,
                _emailTextField(),
                _sizeBox,
                _phoneTextField(),
                _sizeBox,
                _employment(),
                _educationQ(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _educationQ() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Education Qualification : ",
          style: TextStyle(
            color: White,
            fontSize: 15,
          ),
        ),
        _EducationQDropDown(educationQBLOC: _educationQBLOC),
      ],
    );
  }

  Row _employment() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Employment Status : ",
          style: TextStyle(
            color: White,
            fontSize: 15,
          ),
        ),
        _EmploymentDropdown(employmentBLOC: _employmentBLOC),
      ],
    );
  }

  TextFormField _firstNameTextField() {
    return TextFormField(
      controller: _firstNameCntrl,
      validator: (val) => FormValidationCustom.firstName(val),
      style: _inputColor(),
      cursorColor: White,
      decoration: borderDecoration(
        icon: Icons.person,
        labelText: 'First name',
      ),
    );
  }

  TextFormField _lastNameTextField() {
    return TextFormField(
      controller: _lasttNameCntrl,
      validator: (val) => FormValidationCustom.lastName(val),
      style: _inputColor(),
      cursorColor: White,
      decoration: borderDecoration(
        icon: Icons.person,
        labelText: 'Last name',
      ),
    );
  }

  TextFormField _emailTextField() {
    return TextFormField(
      controller: _emailCntrl,
      validator: (val) => FormValidationCustom.email(val),
      style: _inputColor(),
      cursorColor: White,
      decoration: borderDecoration(
        icon: Icons.mail,
        labelText: 'Email',
      ),
    );
  }

  TextFormField _phoneTextField() {
    return TextFormField(
      controller: _phoneCntrlCntrl,
      validator: (val) => FormValidationCustom.phoneNumber(val),
      style: _inputColor(),
      cursorColor: White,
      decoration: borderDecoration(
        icon: Icons.phone_android,
        labelText: 'Phone number',
      ),
    );
  }

  TextStyle _inputColor() => TextStyle(color: White);

  SizedBox get _sizeBox => SizedBox(height: 15);

  _appbar() {
    return appbar(
      context,
      'Add Entry',
      actions: [
        IconButton(
          onPressed: _submit,
          icon: Icon(Icons.check),
        ),
      ],
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final model = FormInputModel(
        firstName: _firstNameCntrl.text.trim(),
        lastName: _lasttNameCntrl.text.trim(),
        email: _emailCntrl.text.trim(),
        phoneNumber: _phoneCntrlCntrl.text.trim(),
        gender: _genderBLOC.value['female']! ? 'Female' : 'Male',
        empStatus: _employmentBLOC.value,
        qualification: _educationQBLOC.value,
      );

      model.formInputModel = model;

      widget.formInputInfoBLOC.feed(model);

      Pop(context);
    }
  }
}

class _Gender extends StatefulWidget {
  final GenderBLOC genderBLOC;

  const _Gender({Key? key, required this.genderBLOC}) : super(key: key);
  @override
  __GenderState createState() => __GenderState();
}

class __GenderState extends State<_Gender> {
  @override
  Widget build(BuildContext context) {
    return _gender();
  }

  Padding _gender() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: StreamBuilder<Map<String, bool>>(
        stream: widget.genderBLOC.genderStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Gender :',
                  style: TextStyle(
                    color: White,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.genderBLOC.selectGender('male');
                  },
                  child: _maleButton(
                    'Male',
                    isSelected: snapshot.data!['male']!,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.genderBLOC.selectGender('female');
                  },
                  child: _maleButton(
                    'Female',
                    isSelected: snapshot.data!['female']!,
                  ),
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  _maleButton(String gender, {required bool isSelected}) {
    return Container(
      height: 20,
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: isSelected
                ? Container(
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CYAN,
                    ),
                  )
                : Container(),
          ),
          // SizedBox(width: 20),
          Text(
            gender,
            style: TextStyle(
              color: White,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmploymentDropdown extends StatefulWidget {
  final EmploymentBLOC employmentBLOC;

  const _EmploymentDropdown({Key? key, required this.employmentBLOC})
      : super(key: key);
  @override
  _EmploymentDropdownState createState() => _EmploymentDropdownState();
}

class _EmploymentDropdownState extends State<_EmploymentDropdown> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      initialData: 'Employed',
      stream: widget.employmentBLOC.stream,
      builder: (context, snapshot) {
        return DropdownButton<String>(
          dropdownColor: CYAN,
          iconEnabledColor: White,
          onChanged: (val) {
            widget.employmentBLOC.setValue(val!);
          },
          value: snapshot.data,
          style: TextStyle(),
          underline: Container(
            color: White,
            height: 2,
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 14,
          ),
          items: ['Employed', 'Un-Employed']
              .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    '$value',
                    style: TextStyle(
                      color: White,
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class _EducationQDropDown extends StatefulWidget {
  final EducationQBLOC educationQBLOC;

  const _EducationQDropDown({Key? key, required this.educationQBLOC})
      : super(key: key);
  @override
  _EducationQDropDownState createState() => _EducationQDropDownState();
}

class _EducationQDropDownState extends State<_EducationQDropDown> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      initialData: 'B.E',
      stream: widget.educationQBLOC.stream,
      builder: (context, snapshot) {
        return DropdownButton<String>(
          dropdownColor: CYAN,
          iconEnabledColor: White,
          onChanged: (val) {
            widget.educationQBLOC.setValue(val!);
          },
          value: snapshot.data,
          underline: Container(
            color: White,
            height: 2,
          ),
          style: TextStyle(),
          icon: Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 14,
          ),
          items: ['SSC', 'HSC', 'B.E', "M.E", 'B Tech', 'M Tech', "Other"]
              .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    '$value',
                    style: TextStyle(
                      color: White,
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
