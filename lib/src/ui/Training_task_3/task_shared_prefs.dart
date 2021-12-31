import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/src/constants/colors.dart';
import 'package:neosoft_training_tasks/src/resources/shared_prefs.dart';
import 'package:neosoft_training_tasks/src/widgets/appbar.dart';
import 'package:neosoft_training_tasks/src/widgets/text_field_decorations.dart';

class SharedPreferencesTask extends StatefulWidget {
  const SharedPreferencesTask({Key? key}) : super(key: key);

  @override
  _SharedPreferencesTaskState createState() => _SharedPreferencesTaskState();
}

class _SharedPreferencesTaskState extends State<SharedPreferencesTask> {
  final _emailCntrl = TextEditingController();
  final _password = TextEditingController();

  final MySharedPreferences _sharedPreferences = new MySharedPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CYAN,
      appBar: appbar(context, 'Preserve Data using Shared Prefernces'),
      body: _body(),
    );
  }

  _body() {
    return FutureBuilder<Map<String, String>>(
      future: _sharedPreferences.getPrefs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Logged In "),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email : ${snapshot.data!['email']!}",
                      style: TextStyle(
                        fontSize: 15,
                        color: White,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Password : ${snapshot.data!['password']!}",
                      style: TextStyle(
                        fontSize: 15,
                        color: White,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                MaterialButton(
                  color: Colors.white,
                  height: 45,
                  onPressed: _logout,
                  child: Text("Clear Preferences / Logout"),
                ),
              ],
            ),
          );
        }
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          children: [
            Text(
              "Login",
              style: TextStyle(
                fontSize: 30,
                color: White,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 30),
            _emailTextField(),
            SizedBox(height: 20),
            _nameTextField(),
            SizedBox(height: 40),
            MaterialButton(
              color: Colors.white,
              height: 45,
              onPressed: _login,
              child: Text("Login"),
            ),
          ],
        );
      },
    );
  }

  _login() async {
    await _sharedPreferences.storePrefs(
      email: _emailCntrl.text.trim(),
      pass: _password.text.trim(),
    );

    setState(() {});
  }

  _logout() async {
    await _sharedPreferences.clearPrefs();
    setState(() {});
  }

  TextFormField _emailTextField() {
    return TextFormField(
      controller: _emailCntrl,
      style: _inputColor(),
      cursorColor: White,
      decoration: borderDecoration(
        icon: Icons.email,
        labelText: 'Email',
      ),
    );
  }

  TextFormField _nameTextField() {
    return TextFormField(
      controller: _password,
      style: _inputColor(),
      cursorColor: White,
      decoration: borderDecoration(
        icon: Icons.lock,
        labelText: 'Password',
      ),
    );
  }

  TextStyle _inputColor() => TextStyle(color: White);
}
